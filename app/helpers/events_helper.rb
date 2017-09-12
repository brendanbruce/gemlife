module EventsHelper
  def days_list
    days_array = []
    for i in 0..6
      date = Date.today + i.days
      day = date.strftime("%A")
      days_array.push([day, date])
    end
    days_array
  end

  def event_flyer_image(event)
    if event_available?(event, event.flyer.url)
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

  def event_venue(event)
    if event_available?(event)
      event.venue.id
    end
  end

  def form_icon(icon)
    fa_icon(icon).html_safe
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

  def user_owns_event?(event)
    event.user_id == current_user.id
  end

  private

  def event_available?(event, property)
    if event and property.present?
      return true
    end
  end
end
