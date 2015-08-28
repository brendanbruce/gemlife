require "rubygems"
require "nokogiri"
require "open-uri"
require "sanitize"

class VenueSeed
  def seed
    Dir.glob("lib/venue_html/*.html").each do |venue|
      venue_page = Nokogiri::HTML(open(venue))
      venue_info_path = venue_page.xpath(
        "//div[@class='ds-listings-header']//div[@class='ds-container']"
      )
      venue_address_node = "//div[@class='ds-detail-meta']/span[@itemprop='address']"

      puts venue_description(venue_info_path)
      puts venue_name(venue_info_path)
      venue_address(venue_info_path, venue_address_node, "streetAddress")
      puts venue_address(venue_info_path, venue_address_node, "addressLocality")
      puts venue_address(venue_info_path, venue_address_node, "addressRegion")
      puts venue_address(venue_info_path, venue_address_node, "postalCode")
      puts venue_phone(venue_info_path)
      puts venue_twitter(venue_info_path)
      puts venue_facebook(venue_info_path)
      puts venue_website(venue_info_path)

      venue = Venue.create!(name: venue_name(venue_info_path),
                   street_address: venue_address(venue_info_path, venue_address_node, "streetAddress"),
                   city: venue_address(venue_info_path, venue_address_node, "addressLocality"),
                   state: venue_address(venue_info_path, venue_address_node, "addressRegion"),
                   zip_code: venue_address(venue_info_path, venue_address_node, "postalCode"),
                   phone: venue_phone(venue_info_path),
                   twitter_url: venue_twitter(venue_info_path),
                   facebook_url: venue_facebook(venue_info_path),
                   website_url: venue_website(venue_info_path)
                  )
      puts "#{venue_name(venue_info_path)} Venue Created"
    end
  end

  private

  def venue_name(venue_info_path)
    venue_info_path.xpath("//h1/text()").to_s.strip
  end

  def venue_description(venue_info_path)
    venue_description = venue_info_path.xpath(
      "//div[@class='ds-detail-description']/node()"
    ).to_s.strip
    Sanitize.fragment(venue_description)
  end

  def venue_address(venue_info_path, venue_address_node, node_name)
    address_item = venue_info_path.xpath(venue_address_node + "/meta[@itemprop='#{node_name}']/@content")
    if address_item.empty?
      nil
    else
      address_item.to_s
    end
  end

  def venue_phone(venue_info_path)
    phone = venue_info_path.xpath(
      "//div[@class='ds-detail-meta']/span[@class='ds-detail-phone ds-meta-item']/a/text()"
    ).to_s.strip
    if phone.empty?
      nil
    else
      phone
    end
  end

  def venue_twitter(venue_info_path)
    venue_twitter = venue_info_path.xpath(
      "//div[@class='ds-detail-meta']/span[@class='ds-detail-twitter ds-meta-item']/a/text()"
    )
    if venue_twitter.empty?
      nil
    else
      venue_twitter.to_s.strip[1..-1]
    end
  end

  def venue_facebook(venue_info_path)
    venue_facebook = venue_info_path.xpath(
      "//div[@class='ds-detail-meta']/span[@class='ds-detail-facebook ds-meta-item']/a/@href"
    ).to_s.strip
    if venue_facebook.empty?
      nil
    else
      venue_facebook
    end
  end

  def venue_website(venue_info_path)
    venue_website = venue_info_path.xpath(
      "//div[@class='ds-detail-meta']/span[@class='ds-detail-website ds-meta-item']/a/@href"
    ).to_s.strip
    if venue_website.empty?
      nil
    else
      venue_website
    end
  end
end
