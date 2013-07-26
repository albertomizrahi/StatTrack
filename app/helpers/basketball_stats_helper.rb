module BasketballStatsHelper

  def convert_seconds_to_time(seconds)

    minutes = seconds.to_i / 60
    seconds_left = seconds.to_i % 60

    #If there are less than 10 minutes we add a zero, so that it looks like 0x:xx instead of x:xx
    if minutes < 10
      minutes = "#{0}#{minutes}"
    end
    #If there are less than 10 seconds we add a zero, so that it looks like xx:0x instead of xx:x
    if seconds_left < 10
      seconds_left = "#{0}#{seconds_left}"
    end

    "#{minutes}:#{seconds_left}"

  end

  def calc_average (total_shots_made, total_shots)
    if total_shots.zero?
      return "-"
    end

    "#{number_with_precision (total_shots_made/total_shots.to_f)*100, :precision => 1}%"
  end

end
