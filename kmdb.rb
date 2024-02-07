# In this assignment, you'll be using the domain model from hw1 (found in the hw1-solution.sql file)
# to create the database structure for "KMDB" (the Kellogg Movie Database).
# The end product will be a report that prints the movies and the top-billed
# cast for each movie in the database.

# To run this file, run the following command at your terminal prompt:
# `rails runner kmdb.rb`

# Requirements/assumptions
#
# - There will only be three movies in the database – the three films
#   that make up Christopher Nolan's Batman trilogy.
# - Movie data includes the movie title, year released, MPAA rating,
#   and studio.
# - There are many studios, and each studio produces many movies, but
#   a movie belongs to a single studio.
# - An actor can be in multiple movies.
# - Everything you need to do in this assignment is marked with TODO!

# Rubric
# 
# There are three deliverables for this assignment, all delivered within
# this repository and submitted via GitHub and Canvas:
# - Generate the models and migration files to match the domain model from hw1.
#   Table and columns should match the domain model. Execute the migration
#   files to create the tables in the database. (5 points)
# - Insert the "Batman" sample data using ruby code. Do not use hard-coded ids.
#   Delete any existing data beforehand so that each run of this script does not
#   create duplicate data. (5 points)
# - Query the data and loop through the results to display output similar to the
#   sample "report" below. (10 points)

# Submission
# 
# - "Use this template" to create a brand-new "hw2" repository in your
#   personal GitHub account, e.g. https://github.com/<USERNAME>/hw2
# - Do the assignment, committing and syncing often
# - When done, commit and sync a final time before submitting the GitHub
#   URL for the finished "hw2" repository as the "Website URL" for the 
#   Homework 2 assignment in Canvas

# Successful sample output is as shown:

# Movies
# ======

# Batman Begins          2005           PG-13  Warner Bros.
# The Dark Knight        2008           PG-13  Warner Bros.
# The Dark Knight Rises  2012           PG-13  Warner Bros.

# Top Cast
# ========

# Batman Begins          Christian Bale        Bruce Wayne
# Batman Begins          Michael Caine         Alfred
# Batman Begins          Liam Neeson           Ra's Al Ghul
# Batman Begins          Katie Holmes          Rachel Dawes
# Batman Begins          Gary Oldman           Commissioner Gordon
# The Dark Knight        Christian Bale        Bruce Wayne
# The Dark Knight        Heath Ledger          Joker
# The Dark Knight        Aaron Eckhart         Harvey Dent
# The Dark Knight        Michael Caine         Alfred
# The Dark Knight        Maggie Gyllenhaal     Rachel Dawes
# The Dark Knight Rises  Christian Bale        Bruce Wayne
# The Dark Knight Rises  Gary Oldman           Commissioner Gordon
# The Dark Knight Rises  Tom Hardy             Bane
# The Dark Knight Rises  Joseph Gordon-Levitt  John Blake
# The Dark Knight Rises  Anne Hathaway         Selina Kyle

# Delete existing data, so you'll start fresh each time this script is run.
# Use `Model.destroy_all` code.
# TODO!
Studio.destroy_all
Actor.destroy_all
Movie.destroy_all
Role.destroy_all
# Generate models and tables, according to the domain model.
# TODO!
# rails runner data.rb

# Insert data into the database that reflects the sample data shown above.
# Do not use hard-coded foreign key IDs.
# TODO!
new_studio = Studio.new
new_studio["studio_name"] = "Warner Bros."
new_studio.save

Warner_Bros = Studio.find_by({ "studio_name" => "Warner Bros." })

new_movie = Movie.new
new_movie["title"] = "Batman Begins"
new_movie["year_released"] = 2005
new_movie["rated"] = "PG-13"
new_movie["studio_id"] = Warner_Bros["id"]
new_movie.save

new_movie = Movie.new
new_movie["title"] = "The Dark Knight"
new_movie["year_released"] = 2008
new_movie["rated"] = "PG-13"
new_movie["studio_id"] = Warner_Bros["id"]
new_movie.save

new_movie = Movie.new
new_movie["title"] = "The Dark Knight Rises"
new_movie["year_released"] = 2012
new_movie["rated"] = "PG-13"
new_movie["studio_id"] = Warner_Bros["id"]
new_movie.save

new_actor = Actor.new
new_actor["actor_name"] = "Christian Bale"
new_actor.save

new_actor = Actor.new
new_actor["actor_name"] = "Michael Caine"
new_actor.save

new_actor = Actor.new
new_actor["actor_name"] = "Liam Neeson"
new_actor.save

new_actor = Actor.new
new_actor["actor_name"] = "Katie Holmes"
new_actor.save

new_actor = Actor.new
new_actor["actor_name"] = "Gary Oldman"
new_actor.save

new_actor = Actor.new
new_actor["actor_name"] = "Heath Ledger"
new_actor.save

new_actor = Actor.new
new_actor["actor_name"] = "Aaron Eckhart"
new_actor.save

new_actor = Actor.new
new_actor["actor_name"] = "Maggie Gyllenhaal"
new_actor.save

new_actor = Actor.new
new_actor["actor_name"] = "Tom Hardy"
new_actor.save

new_actor = Actor.new
new_actor["actor_name"] = "Joseph Gordon-Levitt"
new_actor.save

new_actor = Actor.new
new_actor["actor_name"] = "Anne Hathaway"
new_actor.save

Batman_Begins = Movie.find_by({"title" => "Batman Begins"})
The_Dark_Knight = Movie.find_by({"title" => "The Dark Knight"})
The_Dark_Knight_Rises = Movie.find_by({"title" => "The Dark Knight Rises"})
Christian_Bale = Actor.find_by({"actor_name" => "Christian Bale"})
Michael_Caine = Actor.find_by({"actor_name" => "Michael Caine"})
Liam_Neeson = Actor.find_by({"actor_name" => "Liam Neeson"})
Katie_Holmes = Actor.find_by({"actor_name" => "Katie Holmes"})
Gary_Oldman = Actor.find_by({"actor_name" => "Gary Oldman"})
Heath_Ledger = Actor.find_by({"actor_name" => "Heath Ledger"})
Aaron_Eckhart = Actor.find_by({"actor_name" => "Aaron Eckhart"})
Maggie_Gyllenhaal = Actor.find_by({"actor_name" => "Maggie Gyllenhaal"})
Tom_Hardy = Actor.find_by({"actor_name" => "Tom Hardy"})
Joseph_Gordon_Levitt = Actor.find_by({"actor_name" => "Joseph Gordon-Levitt"})
Anne_Hathaway = Actor.find_by({"actor_name" => "Anne Hathaway"})

new_role = Role.new
new_role["movie_id"] = Batman_Begins["id"]
new_role["actor_id"] = Christian_Bale["id"]
new_role["character_name"] = "Bruce Wayne"
new_role.save

new_role = Role.new
new_role["movie_id"] = Batman_Begins["id"]
new_role["actor_id"] = Michael_Caine["id"]
new_role["character_name"] = "Alfred"
new_role.save

new_role = Role.new
new_role["movie_id"] = Batman_Begins["id"]
new_role["actor_id"] = Liam_Neeson["id"]
new_role["character_name"] = "Ra's Al Ghul"
new_role.save

new_role = Role.new
new_role["movie_id"] = Batman_Begins["id"]
new_role["actor_id"] = Katie_Holmes["id"]
new_role["character_name"] = "Rachel Dawes"
new_role.save

new_role = Role.new
new_role["movie_id"] = Batman_Begins["id"]
new_role["actor_id"] = Gary_Oldman["id"]
new_role["character_name"] = "Commissioner Gordon"
new_role.save

new_role = Role.new
new_role["movie_id"] = The_Dark_Knight["id"]
new_role["actor_id"] = Christian_Bale["id"]
new_role["character_name"] = "Bruce Wayne"
new_role.save

new_role = Role.new
new_role["movie_id"] = The_Dark_Knight["id"]
new_role["actor_id"] = Heath_Ledger["id"]
new_role["character_name"] = "Joker"
new_role.save

new_role = Role.new
new_role["movie_id"] = The_Dark_Knight["id"]
new_role["actor_id"] =  Aaron_Eckhart["id"]
new_role["character_name"] = "Harvey Dent"
new_role.save

new_role = Role.new
new_role["movie_id"] = The_Dark_Knight["id"]
new_role["actor_id"] =  Michael_Caine["id"]
new_role["character_name"] = "Alfred"
new_role.save

new_role = Role.new
new_role["movie_id"] = The_Dark_Knight["id"]
new_role["actor_id"] =  Maggie_Gyllenhaal["id"]
new_role["character_name"] = "Rachel Dawes"
new_role.save


new_role = Role.new
new_role["movie_id"] = The_Dark_Knight_Rises["id"]
new_role["actor_id"] = Christian_Bale["id"]
new_role["character_name"] = "Bruce Wayne"
new_role.save

new_role = Role.new
new_role["movie_id"] = The_Dark_Knight_Rises["id"]
new_role["actor_id"] = Gary_Oldman["id"]
new_role["character_name"] = "Commissioner Gordon"
new_role.save

new_role = Role.new
new_role["movie_id"] = The_Dark_Knight_Rises["id"]
new_role["actor_id"] = Tom_Hardy["id"]
new_role["character_name"] = "Bane"
new_role.save

new_role = Role.new
new_role["movie_id"] = The_Dark_Knight_Rises["id"]
new_role["actor_id"] = Joseph_Gordon_Levitt["id"]
new_role["character_name"] = "John Blake"
new_role.save

new_role = Role.new
new_role["movie_id"] = The_Dark_Knight_Rises["id"]
new_role["actor_id"] = Anne_Hathaway["id"]
new_role["character_name"] = "Selina Kyle"
new_role.save

# Prints a header for the movies output
puts "Movies"
puts "======"
puts ""

# Query the movies data and loop through the results to display the movies output.
# TODO!
movie_list = Movie.all
for movie in movie_list
  movie_name = movie["title"]
  movie_rating = movie["rated"]
  movie_year = movie["year_released"]
  studio_name_store = Studio.find_by({"id" => movie["studio_id"]})
  studio_name = studio_name_store["studio_name"]
  puts "#{movie_name} #{movie_year} #{movie_rating} #{studio_name}"
end

# Prints a header for the cast output
puts ""
puts "Top Cast"
puts "========"
puts ""

# Query the cast data and loop through the results to display the cast output for each movie.
# TODO!
role_list = Role.all
for role in role_list
  movie_title_store = Movie.find_by({"id" => role["movie_id"]})
  movie_title = movie_title_store["title"]
  actor_title_store = Actor.find_by ({"id" => role["actor_id"]})
  actor_title = actor_title_store ["actor_name"]
  character = role["character_name"]
  puts"#{movie_title} #{actor_title} #{character}"

end