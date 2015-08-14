namespace :venue do
  desc "Scrapes all venues from external site"
  task :scrape => :environment do
    puts "Starting pull down of venues"
  end

  desc "Seeds downloaded data into app"
  task :seed => :environment do
    seeder = VenueSeed.new
    seeder.seed
  end
end
