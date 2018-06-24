#CLI Controller
class DailyFitness::CLI

  def call
    # introductory_message
    # #Calls the intro method
    # choose
    # #Calling choose method
    deals
    display_deals
  end

  def deals
    top_deals = Scraper.info
    Deals.create_from_products(top_deals)
  end

  def display_deals
    Deals.all.each do |product|
      puts "#{product.title.upcase}".colorize(:green)
    end
  end

  def doc
    @doc ||= Nokogiri::HTML(open("https://bodybuilding.com"))
  end

  def introductory_message
    #Introductory message is first to pop up when activating the CLI.
    puts "Hello! Are you ready to supplement your fitness lifestyle?".colorize(:green) + "
    \nChoose between four options.
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
          nutritional_article(doc)
        when "2"
          workout_article(doc)
        # when "3"
        #   supplement_article(doc)
        # when "4"
        #   motivation_article(doc)
        when "exit"
          closing_message
        else
          #If the user does not enter a number 1-4, this message will remind
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
    puts "\nCome back later for daily fitness information and motivation, Goodbye!".colorize(:green)
  end
end
