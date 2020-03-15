# Set up for the application and database. DO NOT CHANGE. #############################
require "sequel"                                                                      #
connection_string = ENV['DATABASE_URL'] || "sqlite://#{Dir.pwd}/development.sqlite3"  #
DB = Sequel.connect(connection_string)                                                #
#######################################################################################

# Database schema - this should reflect your domain model
DB.create_table! :blog do
  primary_key :id
  String :title
  String :content, text: true
  String :date
  String :img
end
DB.create_table! :comments do
  primary_key :id
  foreign_key :blog_id
  foreign_key :user_id
  Boolean :like
  String :name
  String :email
  String :topics, text: true
  String :comments, text: true
end

DB.create_table! :users do
  primary_key :id
  String :name
  String :email
  String :password
  String :phone
end

# Insert initial (seed) data
blog_table = DB.from(:blog)

blog_table.insert(title: "Multi-tasking with Uber + Lyft", 
                    content: "Driving with Uber and Lyft at the same time can be tricky, but many drivers find that it helps to maximize income when done right. Here are the best of the best tips we have seen from drivers who choose to use Uber and Lyft at the same time: 
                    Don’t use 2 phones - it is distracting, often worrisome for the passenger, and usually not worth the extra cell phone payments.
                    Close out all other apps from running - Just running Uber and Lyft takes up A LOT of data, which can slow down your phone. Closing out all other apps helps to prevent your phone from crashing.
                    Run Uber on the main screen - Uber closes out after a couple minute of inactivity, therefore, you need to have Uber open on the main screen. However, Lyft will keep running  in the background - allowing you to have both Uber and Lyft going at the same time.
                    Choosing a ride - Oftentimes, when you have both running, you may get a ride from both Uber and Lyft simultaneously. Which ride should you choose? The one closest to you. This helps you save time between rides. The key to making more money is having a passenger in the car at all times.
                    Log out immediately - Do not forget to close out of the other app (the one you did not accept a ride with).
                    Tell us what YOU think about driving with both Uber and Lyft in the comments below!",
                    date: "March 9")

blog_table.insert(title: "DJ or Driver?", 
                    content: "Have you ever been jamming to music but a rider asks you turn it down? We’ve been there, too.  But it got us wondering, what is the best music to play for passengers during rides? We did some digging, and the answer might surprise you. 
                    The most well-received music for passengers is … (drum roll please) … JAZZ! Passengers want their rides to be peaceful, and surprisingly, rap and top 40 pop songs don’t exactly make rides relaxing. 
                    Whether you buy into the Jazz theory or not, here are some more tips for playing music during rides that will help you increase your driver rating and earn more tips",
                    date: "March 3")
