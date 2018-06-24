#CLI Controller
class DailyFitness::CLI

  def call
    introductory_message
    # #Calls the intro method
    choose
    # #Calling choose method
  end

  def doc
    @doc ||= Nokogiri::HTML(open("https://bodybuilding.com"))
  end

  def introductory_message
    #Introductory message is first to pop up when activating the CLI.
    puts "Hello! Are you ready to supplement your fitness lifestyle?".colorize(:green) + "
    \nChoose between two options.
    Press “1” for the Top Deals of the day,
    Press “2” for the Top Articles of the day"
  end

  def choose
    #After the introductory message, the put below is a fun welcoming one to engage
    #the user.
    puts "\nPlease proceed with one of the options above if you are serious about your gains!".colorize(:green) +
    " \nIf you do not want to continue, just type 'exit'.".colorize(:red)
    input = nil
    while input != "exit"
    input = gets.strip
      case input
        #each case number is assigned to a specific section in bodybuilding.com
        #covering various topics.
        when "1"
          deals
          display_deals
        when "2"
          articles
          display_articles
        when "exit"
          closing_message
        else
          #If the user does not enter a number 1-2, this message will remind
          #them to go over the rules again.
          puts "That is not an option,
          Press “1” for the Top Deals of the day,
          Press “2” for the Top Articles of the day,
          Or type 'exit' if you do not want to continue."
      end
    end
  end

  def list
    #The list will be called each time an article is activated in the CLI
    #This will ensure the CLI instructions will always be present to the user
    puts"
    Press “1” for the Top Deals of the day,
    Press “2” for the Top Articles of the day,
    Or type 'exit' if you do not want to continue."
  end

  def closing_message
    puts "\nCome back later for daily fitness information, motivation, and promotions, Goodbye!".colorize(:green)
  end
end

def deals
  top_deals = Scraper.scrape_top_deals
  Deals.create_from_products(top_deals)
end

def display_deals
   puts "------------Top Deals of the Day------------"
  Deals.all.each do |product|
    puts "\n#{product.title.upcase}".colorize(:green) + " - " + "#{product.price}\n".colorize(:white) + "
      Current Promotion -" + " #{product.promotion}\n".colorize(:red) + "
      This product has a rating of: #{product.rating}
      Click the link for more information:" + " #{product.link}\n".colorize(:light_blue)
    puts "------------------------"
  end
  list
end

def articles
  top_articles = Scraper.scrape_top_articles
  Articles.create_from_articles(top_articles)
end

def display_articles
   puts "------------Top Articles of the Day------------"
  Articles.all.each do |article|
    puts "\n#{article.title}".colorize(:green) + " - #{article.category}".colorize(:red) + "\n\n#{article.description}" "
    \nClick on the link to view the full report - " + "#{article.link}".colorize(:blue) + "
    \nIf you want more related articles on" + " #{article.category}".colorize(:red) + ", click on the link - " + "#{article.category_link}\n".colorize(:light_blue)
    puts "------------------------"
  end
  list
end
