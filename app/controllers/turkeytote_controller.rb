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

  def totals
    @everything = Holidaybird.all
    get_totals '   ', '  '
  end

  def set_variables (channel, cost_center = ' ')
    @forecast_value = false
    if cost_center == ' '
      if channel == 'CON'
        @main = Holidaybird.where(channel: channel).all
        @main = @main.sort_by &:sku
        @date = get_db_timestamp
      else
#        if channel == 'FS'
#          t = Holidaybird.arel_table
#          @everything = Holidaybird.where(t[:channel].eq("FSV").or(t[:channel].eq("FSR"))).all
#        else
          @everything = Holidaybird.where(channel: channel).all
#        end
        get_totals channel, '  '
      end
    else
#      if channel == 'FS'
#        t = Holidaybird.arel_table
#        @main = Holidaybird.where((t[:channel].eq("FSV").or(t[:channel].eq("FSR"))).and(t[:cc].eq(cost_center))).all
#      else
        @main = Holidaybird.where(channel: channel, cc: cost_center).all
#      end
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
        end
        first_instance_of_sku.shipped = shipped
        first_instance_of_sku.ordered = ordered
        first_instance_of_sku.forecast = forecast
        first_instance_of_sku.harvest = harvest
        first_instance_of_sku.adjustment = adjustment
        @main.push(first_instance_of_sku)
      end
    end
    @main = @main.sort_by &:sku
    @date = get_db_timestamp
  end

  def get_db_timestamp
    first = Holidaybird.first
    date = first.datetime
  end
end
