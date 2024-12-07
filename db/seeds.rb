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

50.times do |i|
    fname = Faker::Name.first_name
    lname = Faker::Name.last_name
    @player = Player.create!(
        username: fname + " " + lname,
        display_name: Faker::Verb.ing_form,
        use_display_name: Faker::Boolean.boolean,
        password: "password",
        email: fname.downcase + lname.downcase + "@gmail.com"
    )

    5.times do |j|
        temp = Round::BOOLEAN_STRINGS.sample
        final = ""
        if (temp == Round::BOOLEAN_STRINGS[0])
            final = Round::VALID_NORMAL_THROWS.sample
        else
            final = Round::VALID_CLUTCH_THROWS.sample
        end
        round = Round.create!(
            player_id: @player.id,
            score_1: Round::VALID_NORMAL_THROWS.sample,
            score_2: Round::VALID_NORMAL_THROWS.sample,
            score_3: Round::VALID_NORMAL_THROWS.sample,
            score_4: Round::VALID_NORMAL_THROWS.sample,
            called_clutch: temp,
            score_5: final
        )
    end
end
puts "Created 50 Fake Players with 5 rounds each"