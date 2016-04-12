module ProfileHelper
  def member_since_date(time)
    time.strftime("%B %Y")
  end
end
