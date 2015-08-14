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

      puts venue_description(venue_info_path)
    end
  end

  def venue_name(venue_info_path)
    venue_info_path.xpath("//h1/text()").to_s.strip
  end

  def venue_description(venue_info_path)
    venue_description = venue_info_path.xpath(
      "//div[@class='ds-detail-description']/node()"
    ).to_s.strip
    Sanitize.fragment(venue_description)
  end

  def venue_address(venue_info_path)
  end
end
