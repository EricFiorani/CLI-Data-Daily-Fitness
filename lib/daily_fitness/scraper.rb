class Scraper

  def self.info
    self.scrape_top_deals
  end

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

  def self.scrape_top_articles
    articles = []
    doc = Nokogiri::HTML(open("https://bodybuilding.com"))
    doc.css(".NewArticle").each do |article|
      category = article.css(".NewArticle-category").text
      category_link = article.css(".NewArticle-category a").attr('href')
      title = article.css(".NewArticle-title").text
      description = article.css(".NewArticle-description").text
      link = article.css(".NewArticle-figure a").attr('href')
      articles << {category: category, category_link: category_link, title: title, description: description, link: link}
    end
    articles
    # binding.pry
  end


end
