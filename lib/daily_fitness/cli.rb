#CLI Controller
class DailyFitness::CLI

  def call
    introductory_message
    #Calls the intro method
    choose
    #calling choose method
  end

  def introductory_message
    puts "Hello! Are you ready to supplement your fitness lifestyle?".colorize(:green) + "
    \nChoose between three options.
    Press “1” for the Nutritional Article of the day,
    Press “2” for the Workout Article of the day,
    Press “3” for the Supplement Article of the day,
    Press “4” for the Motivational Article of the day,
    Or type 'exit' if you do not want to continue"
  end

  def workout_article
    @article = DailyFitness::Workout.info
    @article.each do |article|
      puts "------------------------"
      puts "\n#{article.title}".colorize(:green) + "\n\n#{article.description}" +
      "\n\nClick on the link to view the full report -" + " #{article.url}".colorize(:light_blue)
      puts "\n------------------------"
    end
    list
  end

  def list
    puts"
    Press “1” for the Nutritional Article of the day,
    Press “2” for the Workout Article of the day,
    Press “3” for the Supplement Article of the day,
    Press “4” for the Motivational Article of the day,
    Or type 'exit' if you do not want to continue"
  end

  def nutritional_article
    # @nutritional_article = DailyFitness::Nutrition.info
    puts "this is an article"
  end

  def supplement_article

    puts "this is an article"
  end

  def motivation_article

    puts "this is an article"
  end

  def choose
    puts "\nPlease proceed with one of the options above if you are serious about your gains!".colorize(:green) +
    " \nIf you do not want to continue, just type 'exit'."
    input = nil
    while input != "exit"
      # puts "\n Would you like to choose another option?"
      #prompts the user to select a choice and continue getting new information
    input = gets.strip
      case input
        when "1"
          nutritional_article
        when "2"
          workout_article
        when "3"
          supplement_article
        when "4"
          motivation_article
        when "exit"
          closing_message
        else
          puts "That is not an option,
          Press “1” for the Nutritional Article of the day,
          press “2” for the Workout Article of the day,
          press “3” for the Supplement Article of the day,
          press “4” for the Motivational Article of the day,
          or type 'exit' if you do not want to continue"
      end
    end
  end

  def closing_message
    puts "\nCome back later for daily fitness information and motivation, Goodbye!".colorize(:green)
  end

end
