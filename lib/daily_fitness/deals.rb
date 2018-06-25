class Deals

  attr_accessor :promotion, :title, :price, :rating, :link, :top_deals

  @@all = []

  def initialize(deal_hash)
    #creates a hash that organizes the keys and values of the newly created
    #information funneled in via send.
    deal_hash.each {|k, v| self.send(("#{k}="), v)}
    @@all << self
  end

  def self.create_from_products(top_deals)
    #takes in an array of hashes from the scraper
    #called through the CLI that prompts the initialization of a hash
    #(deal_hash)
    top_deals.each {|deal_hash| Deals.new(deal_hash)}
  end

  def self.all
    @@all
  end

end
