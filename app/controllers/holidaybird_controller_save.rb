class HolidaybirdController < ApplicationController
  def ret
    set_variables 'RET'
  end

  def consumer
    set_variables 'CON'
  end

  def fsv
    set_variables 'FSV'
  end

  def fsvnj
    set_variables 'FSV' 'NJ'
end

  def fsvil
    set_variables 'FSV' 'IL'
  end

  def fsvtx
    set_variables 'FSV' 'TX'
  end

  def fsvga
    set_variables 'FSV' 'GA'
  end

  def fsr
    set_variables 'FSR'
  end

  def fsrnj
    set_variables 'FSR' 'NJ'
  end

  def fsril
    set_variables 'FSR' 'IL'
  end

  def fsrtx
    set_variables 'FSR' 'TX'
  end

  def fsrga
    set_variables 'FSR' 'GA'
  end

  def totals
    everything = Holidaybird.all
    sku_array = Array.new
    @main = Array.new
    everything.each do |s|
      if !sku_array.include?(s.sku)
        sku_array.push(s.sku)
        shipped = 0
        ordered = 0
        forecast = 0
        harvest = 0
        adjustment = 0
        first_instance_of_sku = Holidaybird.where(sku: s.sku).first
        all_instances_of_sku = Holidaybird.where(sku: s.sku).all
        all_instances_of_sku.each do|t|
          shipped += t.shipped
          ordered += t.ordered
          forecast += t.forecast
          harvest += t.harvest
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

  def set_variables (channel, cost_center = ' ')
    if cost_center == ' '
      @main = Holidaybird.where(channel: channel).all
    else
      this_channel = Holidaybird.where(channel: channel).all
      @main = this_channel.where(costcenter: cost_center).all
    end
    @main = @main.sort_by &:sku
    @date = get_db_timestamp
  end

  def get_db_timestamp
    first = Holidaybird.first
    date = first.datetime
  end
end
