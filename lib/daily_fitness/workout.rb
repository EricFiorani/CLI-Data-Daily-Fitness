class DailyFitness::Workout

  attr_accessor :title, :description, :url

  def self.info
    self.scrape_article
  end

  def scrape_article
    workout = []

    workout << self.bodybuilding

    workout
  end

  def self.bodybuilding

    doc = Nokogiri::HTML(open("https://bodybuilding.com"))

    workout = self.new
    workout.title = doc.search("#DPG_Workouts_Main .cms-article-list--article.hero .title").text.strip
    workout.description = doc.search("#DPG_Workouts_Main .cms-article-list--article.hero .description").text.strip
    workout.url = doc.search("#DPG_Workouts_Main .cms-article-list--article.hero a.thumb-container").map {|link| link['href'] }

    # binding.pry
    # info = self.new
    # info.title = "this is a title"
    # info.description = "this is an abstract summary"
    # info.url = "https://bodybuilding.com"
    #
    workout
  end

end
