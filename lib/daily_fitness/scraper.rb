class DailyFitness::Scraper

  def self.info(doc)
    self.scrape_top_deals(doc)
  end

  def doc
    @doc ||= Nokogiri::HTML(open("https://bodybuilding.com"))
  end

  def self.scrape_top_deals
    products = []
    doc = Nokogiri::HTML(open("https://bodybuilding.com"))
    doc.css("div.ContentCarousel-view").each do |container|
      container.css(".FeaturedProduct").each do |product|
        # promotion = student.css('.student-name').text
        # title = student.css('.student-location').text
        # price = "#{student.attr('href')}"
        # rating =
        # link = doc.search("#DPG_Motivation_Main .cms-article-list--article.hero a.thumb-container").map {|link| link['href'] }
        products << {promo: promotion, title: title, price: price, rating: rating, link: link}
      end
    end
    products
    binding.pry
  end


end
