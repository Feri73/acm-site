module TimeHelper
  def persian_relative_time my_time
    days_ago = many_days_ago? my_time
    if  days_ago < 7
      if days_ago < 1
        return my_time.to_jalali.strftime("%H:%M").persian_cleanup
      elsif days_ago < 2
        return "دیروز" + my_time.to_jalali.strftime("%H:%M").persian_cleanup
      else
        return my_time.to_jalali.strftime("%A %H:%M").persian_cleanup
      end
    else
      months_ago = many_months_ago? my_time
      if months_ago < 12
        return my_time.to_jalali.strftime("%H:%M %B %d").persian_cleanup
      else
        return my_time.to_jalali.strftime("%H:%M %d %B %y ").persian_cleanup
      end
    end

  end
  def many_days_ago? my_time
    (time_diff_sec Time.now, my_time) / 1.day
  end

  def many_months_ago? my_time
    (time_diff_sec Time.now, my_time) / 1.month
  end

  def time_diff_sec time1, time2
    ((time1-time2)).to_i
  end
end
