# Specifications for the CLI Assessment

Specs:
- [x] Have a CLI for interfacing with the application
      
      - The CLI is fully operational under CLI.rb which is called on via DailyFitness::CLI.new.call from the daily-fitness bin file.
- [x] Pull data from an external source
      
      - Data is scraped from https://bodybuilding.com on four different sections of their homepage.
- [x] Implement both list and detail views
      
      -When the CLI is called on via ./bin/daily-fitness
      -There will be a welcome message followed by a list. Read the instructions and choose the desired option of your choice, this will         give a detailed view of the option going a level deeper. You then have the option to view the full report via url link in the             detailed view.

