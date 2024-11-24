# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require 'faker' # Make sure the Faker gem is installed
#require 'open-uri' # To open the image URL

# Destroy existing records
Round.destroy_all
Player.destroy_all

player = Player.create!(
    username: "CANA"
    display_name: "temp"
    use_display_name: "true"
    email: "student#{i + 1}@msudenver.edu",
    password: "password",  # Set a default password
    password_confirmation: "password"
)

    # Create a portfolio for the student
Round.create!(
    player: player,
    score_1: "5"
    score_2: "5"
    score_3: "5"
    score_4: "5"
    called_clutch: "true"
    score_5: "7"
  )

puts "Created Fake Cana with Round?"