class DailyFitness::Supplement

  attr_accessor :title, :description, :url

  def self.info(doc)
    self.scrape_article(doc) #.Info is called from CLI.rb to produce the scraped article.
  end

  def self.scrape_article(doc)
    article = [] #Creates an empty array of the article

    article << self.featured(doc) #Adds the scraped data to the article array
    article << self.sub_article_1(doc)
    article << self.sub_article_2(doc)
    article << self.sub_article_3(doc)

    article #Returns on the array to produce the data.
  end

  def self.featured(doc)

    article = self.new
    article.title = doc.search("#DPG_Supplementation_Main .cms-article-list--article.hero .title").text.strip
    article.description = doc.search("#DPG_Supplementation_Main .cms-article-list--article.hero .description").text.strip
    article.url = doc.search("#DPG_Supplementation_Main .cms-article-list--article.hero a.thumb-container").map {|link| link['href'] }

    #binding.pry
    article
  end

  def self.sub_article_1(doc)

    article = self.new
    article.title = doc.search("#DPG_Supplementation_Sub_1 .title").text.strip
    article.description = doc.search("#DPG_Supplementation_Sub_1 .description").text.strip
    article.url = doc.search("#DPG_Supplementation_Sub_1 a.thumb-container").map {|link| link['href'] }

    # binding.pry
    article
  end

  def self.sub_article_2(doc)

    article = self.new
    article.title = doc.search("#DPG_Supplementation_Sub_2 .title").text.strip
    article.description = doc.search("#DPG_Supplementation_Sub_2 .description").text.strip
    article.url = doc.search("#DPG_Supplementation_Sub_2 a.thumb-container").map {|link| link['href'] }

    # binding.pry
    article
  end

  def self.sub_article_3(doc)

    article = self.new
    article.title = doc.search("#DPG_Supplementation_Sub_3 .title").text.strip
    article.description = doc.search("#DPG_Supplementation_Sub_3 .description").text.strip
    article.url = doc.search("#DPG_Supplementation_Sub_3 a.thumb-container").map {|link| link['href'] }

    # binding.pry
    article
  end

end
