module EventsHelper
  def format_date(date)
    date.strftime("%A, %B %-d")
  end

  def format_time(time)
    time.strftime("%l:%M %P")
  end
end
