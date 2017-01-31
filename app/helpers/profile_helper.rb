module ProfileHelper
  def member_since_date(time)
    time.strftime("%B %Y")
  end

  def active_action(action)
    if action == controller.action_name
      "active"
    else
      "link"
    end
  end
end
