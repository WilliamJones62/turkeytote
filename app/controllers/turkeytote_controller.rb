class TurkeytoteController < ApplicationController
  def ret
    set_variables 'RET'
  end

  def retnj
    set_variables 'RET', 'NJ'
  end

  def retil
    set_variables 'RET', 'IL'
  end

  def consumer
    set_variables 'CON'
  end

  def consumernj
    set_variables 'CON', 'NJ'
  end

  def consumeril
    set_variables 'CON', 'IL'
  end

  def consumerga
    set_variables 'CON', 'GA'
  end

  def consumertx
    set_variables 'CON', 'TX'
  end

  def consumerco
    set_variables 'CON', 'CO'
  end

  def fs
    set_variables 'FS'
  end

  def fsnj
    set_variables 'FS', 'NJ'
  end

  def fsil
    set_variables 'FS', 'IL'
  end

  def fstx
    set_variables 'FS', 'TX'
  end

  def fsga
    set_variables 'FS', 'GA'
  end

  def fsco
    set_variables 'FS', 'CO'
  end

  def totalsnj
    @everything = Holidaybird.where(cc: 'NJ').all
    get_totals '   ', 'NJ'
  end

  def totalsil
    @everything = Holidaybird.where(cc: 'IL').all
    get_totals '   ', 'IL'
  end

  def totalsga
    @everything = Holidaybird.where(cc: 'GA').all
    get_totals '   ', 'GA'
  end

  def totalstx
    @everything = Holidaybird.where(cc: 'TX').all
    get_totals '   ', 'TX'
  end

  def totalsco
    @everything = Holidaybird.where(cc: 'CO').all
    get_totals '   ', 'CO'
  end

  def totals
    @everything = Holidaybird.all
    get_totals '   ', '  '
  end

  def set_variables (channel, cost_center = ' ')
    @forecast_value = false
    if cost_center == ' '
      @everything = Holidaybird.where(channel: channel).all
      get_totals channel, '  '
    else
      @main = Holidaybird.where(channel: channel, cc: cost_center).all
      @main = @main.sort_by &:sku
      @date = get_db_timestamp
    end
  end

  def get_totals (channel, cc)
    @forecast_value = false
    sku_array = Array.new
    @main = Array.new
    @everything.each do |s|
      if !sku_array.include?(s.sku)
        sku_array.push(s.sku)
        channel_move = 0
        ict_move = 0
        e21_move = 0
        shipped = 0
        ordered = 0
        forecast = 0
        harvest = 0
        adjustment = 0
        if channel == '   '
          if cc == '  '
            first_instance_of_sku = Holidaybird.where(sku: s.sku).first
            all_instances_of_sku = Holidaybird.where(sku: s.sku).all
          else
            first_instance_of_sku = Holidaybird.where(sku: s.sku, cc: cc).first
            all_instances_of_sku = Holidaybird.where(sku: s.sku, cc: cc).all
          end
        else
          first_instance_of_sku = Holidaybird.where(sku: s.sku, channel: s.channel).first
          all_instances_of_sku = Holidaybird.where(sku: s.sku, channel: s.channel).all
        end
        all_instances_of_sku.each do|t|
          shipped += t.shipped
          ordered += t.ordered
          forecast += t.forecast
          if t.harvest
            harvest += t.harvest
          else
            @forecast_value = true
          end
          adjustment += t.adjustment
          channel_move += t.channel_move
          ict_move += t.ict_move
          e21_move += t.e21_move
        end
        first_instance_of_sku.shipped = shipped
        first_instance_of_sku.ordered = ordered
        first_instance_of_sku.forecast = forecast
        first_instance_of_sku.harvest = harvest
        first_instance_of_sku.adjustment = adjustment
        first_instance_of_sku.channel_move = channel_move
        first_instance_of_sku.ict_move = ict_move
        first_instance_of_sku.e21_move = e21_move
        @main.push(first_instance_of_sku)
      end
    end
    @main = @main.sort_by &:sku
    @date = get_db_timestamp
  end

  def get_db_timestamp
    first = Holidaybird.first
    if first
      date = first.datetime
    end
  end
end
