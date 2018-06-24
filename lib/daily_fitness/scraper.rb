class Scraper

  def self.info
    self.scrape_top_deals
  end

  # def doc
  #   @doc ||= Nokogiri::HTML(open("https://bodybuilding.com"))
  # end

  def self.scrape_top_deals
    products = []
    doc = Nokogiri::HTML(open("https://bodybuilding.com"))
    doc.css(".FeaturedProduct").each do |product|
      promotion = product.css(".FeaturedProduct-promo").text
      title = product.css(".FeaturedProduct-title").text
      price = product.css(".FeaturedProduct-price").text
      rating = product.css(".FeaturedProduct-rating").text
      link = product.css(".FeaturedProduct-title a").attr('href')
      products << {promotion: promotion, title: title, price: price, rating: rating, link: link}
    end
    products
    # binding.pry
  end


end
