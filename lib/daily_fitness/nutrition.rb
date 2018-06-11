class DailyFitness::Nutrition

  attr_accessor :title, :description, :url

  def self.info
    self.scrape_article
  end

  def self.scrape_article
    article = []

    article << self.bodybuilding

    article
  end

  def self.bodybuilding

    doc = Nokogiri::HTML(open("https://bodybuilding.com"))

    article = self.new
    article.title = doc.search("#DPG_Workouts_Main .cms-article-list--article.hero .title").text.strip
    article.description = doc.search("#DPG_Workouts_Main .cms-article-list--article.hero .description").text.strip
    article.url = doc.search("#DPG_Workouts_Main .cms-article-list--article.hero a.thumb-container").map {|link| link['href'] }

    # binding.pry
    article
  end

end
