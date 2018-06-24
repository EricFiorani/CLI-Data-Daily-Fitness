class Deals

  attr_accessor :promotion, :title, :price, :rating, :link, :top_deals

  @@all = []

  def initialize(deal_hash)
    deal_hash.each {|k, v| self.send(("#{k}="), v)}
    @@all << self
  end

  def self.create_from_products(top_deals)
    top_deals.each {|deal_hash| Deals.new(deal_hash)}
  end

  def self.all
    @@all
  end

end
