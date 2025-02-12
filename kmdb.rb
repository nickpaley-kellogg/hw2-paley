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
# - Note rubric explanation for appropriate use of external resources.

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

# - You are welcome to use external resources for help with the assignment (including
#   colleagues, AI, internet search, etc). However, the solution you submit must
#   utilize the skills and strategies covered in class. Alternate solutions which
#   do not demonstrate an understanding of the approaches used in class will receive
#   significant deductions. Any concern should be raised with faculty prior to the due date.

# Submission
# 
# - "Use this template" to create a brand-new "hw2" repository in your
#   personal GitHub account, e.g. https://github.com/<USERNAME>/hw2
# - Do the assignment, committing and syncing often
# - When done, commit and sync a final time before submitting the GitHub
#   URL for the finished "hw2" repository as the "Website URL" for the 
#   Homework 2 assignment in Canvas

# Class definitions

class Movie < ApplicationRecord
  belongs_to :studio
end

class Studio < ApplicationRecord
  has_many :movies
end

class Movie < ApplicationRecord
  belongs_to :studio
  has_many :roles  
  has_many :actors, through: :roles 
end

class Role < ApplicationRecord
  belongs_to :movie
  belongs_to :actor
end


Studio.destroy_all
Movie.destroy_all
Actor.destroy_all
Role.destroy_all

# Studios table data inputs

new_studio = Studio.new
new_studio["studio_name"] = "Warner Bros."
new_studio.save


# Movies table data inputs

warner_bros = Studio.find_by({ "studio_name" => "Warner Bros." })

new_movie = Movie.new
new_movie["title"] = "Batman Begins"
new_movie["year_released"] = "2005"
new_movie["rating"] = "PG-13"
new_movie["studio_id"] = warner_bros["id"]
new_movie.save

new_movie = Movie.new
new_movie["title"] = "The Dark Knight"
new_movie["year_released"] = "2008"
new_movie["rating"] = "PG-13"
new_movie["studio_id"] = warner_bros["id"]
new_movie.save

new_movie = Movie.new
new_movie["title"] = "The Dark Knight Rises"
new_movie["year_released"] = "2012"
new_movie["rating"] = "PG-13"
new_movie["studio_id"] = warner_bros["id"]
new_movie.save

# Actors table data inputs

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
new_actor["actor_name"] = "Anne Hathaway"
new_actor.save

new_actor = Actor.new
new_actor["actor_name"] = "Joseph Gordon-Levitt"
new_actor.save

new_actor = Actor.new
new_actor["actor_name"] = "Tom Hardy"
new_actor.save

# Roles table data inputs

# -- Batman Begins

batman_begins = Movie.find_by({ "title" => "Batman Begins" })

christian_bale = Actor.find_by({"actor_name" => "Christian Bale"})

new_role = Role.new
new_role["character_name"] = "Bruce Wayne"
new_role["movie_id"] = batman_begins["id"]
new_role["actor_id"] = christian_bale["id"]
new_role.save

michael_caine = Actor.find_by({"actor_name" => "Michael Caine"})

new_role = Role.new
new_role["character_name"] = "Alfred"
new_role["movie_id"] = batman_begins["id"]
new_role["actor_id"] = michael_caine["id"]
new_role.save

liam_neeson = Actor.find_by({"actor_name" => "Liam Neeson"})

new_role = Role.new
new_role["character_name"] = "Ra's Al Ghul"
new_role["movie_id"] = batman_begins["id"]
new_role["actor_id"] = liam_neeson["id"]
new_role.save

katie_holmes = Actor.find_by({"actor_name" => "Katie Holmes"})

new_role = Role.new
new_role["character_name"] = "Rachel Dawes"
new_role["movie_id"] = batman_begins["id"]
new_role["actor_id"] = katie_holmes["id"]
new_role.save

gary_oldman = Actor.find_by({"actor_name" => "Gary Oldman"})

new_role = Role.new
new_role["character_name"] = "Commissioner Gordon"
new_role["movie_id"] = batman_begins["id"]
new_role["actor_id"] = gary_oldman["id"]
new_role.save

# -- The Dark Knight

dark_knight = Movie.find_by({ "title" => "The Dark Knight" })

aaron_eckhart = Actor.find_by(actor_name: "Aaron Eckhart")
heath_ledger = Actor.find_by(actor_name: "Heath Ledger")
maggie_gyllenhaal = Actor.find_by(actor_name: "Maggie Gyllenhaal")

Role.create([
  { character_name: "Bruce Wayne", movie_id: dark_knight.id, actor_id: christian_bale.id },
  { character_name: "Alfred", movie_id: dark_knight.id, actor_id: michael_caine.id },
  { character_name: "Harvey Dent", movie_id: dark_knight.id, actor_id: aaron_eckhart.id },
  { character_name: "Rachel Dawes", movie_id: dark_knight.id, actor_id: maggie_gyllenhaal.id },
  { character_name: "Joker", movie_id: dark_knight.id, actor_id: heath_ledger.id }
])


# -- The Dark Knight Rises

dark_knight_rises = Movie.find_by({ "title" => "The Dark Knight Rises" })

tom_hardy = Actor.find_by(actor_name: "Tom Hardy")
joseph_gordon_levitt = Actor.find_by(actor_name: "Joseph Gordon-Levitt")
anne_hathaway = Actor.find_by(actor_name: "Anne Hathaway")

Role.create([
  { character_name: "Bruce Wayne", movie_id: dark_knight_rises.id, actor_id: christian_bale.id },
  { character_name: "Commissioner Gordon", movie_id: dark_knight_rises.id, actor_id: gary_oldman.id },
  { character_name: "Bane", movie_id: dark_knight_rises.id, actor_id: tom_hardy.id },
  { character_name: "John Blake", movie_id: dark_knight_rises.id, actor_id: joseph_gordon_levitt.id },
  { character_name: "Selina Kyle", movie_id: dark_knight_rises.id, actor_id: anne_hathaway.id }
])



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

# Generate models and tables, according to the domain model.
# TODO!

# Insert data into the database that reflects the sample data shown above.
# Do not use hard-coded foreign key IDs.
# TODO!

# Prints a header for the movies output
# Query the movies data and loop through the results to display the movies output.
# TODO!



# Prints a header for the cast output
# Query the cast data and loop through the results to display the cast output for each movie.
# TODO!

# Display Movies

puts "Movies"
puts "======"
puts ""

Movie.all.each do |movie|
  studio_name = movie.studio.studio_name  
  puts "#{movie.title.ljust(22)} #{movie.year_released}  #{movie.rating.ljust(7)} #{studio_name}"
end

# Display Top Cast

puts "Top Cast"
puts "========"
puts ""

Movie.all.each do |movie|
  movie.roles.each do |role|
    puts "#{movie.title.ljust(22)} #{role.actor.actor_name.ljust(20)} #{role.character_name}"
  end
end

