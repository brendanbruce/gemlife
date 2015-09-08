module EventsHelper
  def event_flyer_image(event)
    if event.flyer_file_name.present?
      content_tag(:div, image_tag(event.flyer.url), class: "event__image")
    end
  end

  def format_date(date)
    date.strftime("%A, %B %-d")
  end

  def format_time(time)
    time.strftime("%l:%M %P")
  end
end
