desc "This task is called by the Heroku scheduler add-on"
task :delete_sessions => :environment do
  puts "Updating feed..."
  Session.destroy_all
  puts "done."
end