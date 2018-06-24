class Articles

  attr_accessor :category, :category_link, :title, :description, :link

  @@all = []

  def initialize(article_hash)
    article_hash.each {|k, v| self.send(("#{k}="), v)}
    @@all << self
  end

  def self.create_from_articles(top_articles)
    top_articles.each {|article_hash| Articles.new(article_hash)}
  end

  def self.all
    @@all
  end

end
