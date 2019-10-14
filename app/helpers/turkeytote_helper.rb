module TurkeytoteHelper
  def display_stamp(datetime)
    if datetime.blank?
      formatted = ' '
    else
      formatted = datetime.strftime("%I:%M:%S %p on %A %B %d %Y")
    end
  end
end
