module VenuesHelper
  def twitter_link(venue)
    if venue.twitter_url.present?
      url = twitter_url(venue)
      link_to url, class: "venue-card__icon" do
        fa_icon("twitter")
      end
    end
  end

  def facebook_link(venue)
    if venue.facebook_url.present?
      link_to venue.facebook_url, class: "venue-card__icon" do
        fa_icon("facebook")
      end
    end
  end

  def website_link(venue)
    if venue.website_url.present?
      link_to venue.website_url, class: "venue-card__icon" do
        fa_icon("globe")
      end
    end
  end

  private

  def twitter_url(venue)
    "http://twitter.com/" + venue.twitter_url
  end
end
