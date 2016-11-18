module EventsHelper
  def current_date
    Date.today
  end

  def current_day
    current_date.strftime("%A")
  end

  def event_flyer_image(event)
    if event.flyer_file_name.present?
      content_tag(:div, image_tag(event.flyer.url), class: "event__image")
    end
  end

  def event_like(event)
    if event.users.include?(current_user)
      submit_tag "Unlike"
    else
      submit_tag "Like"
    end
  end

  def format_date(start_date)
    if start_date.present?
      start_date.strftime("%A, %B %-d")
    else
      "No Date specified"
    end
  end

  def format_time(start_time)
    if start_time.present?
      start_time.strftime("%l:%M %P")
    else
      "No Time specified"
    end
  end
end
