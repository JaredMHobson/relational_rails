require 'CSV'
# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Game.destroy_all
# Developer.destroy_all

# CSV.foreach('./data/developers.csv', headers: true, header_converters: :symbol) do |row|
#   Developer.create(row)
# end

# CSV.foreach('./data/games.csv', headers: true, header_converters: :symbol) do |row|
#   Game.create(row)
# end

@riot = Developer.create!(name: "Riot Games", is_indie: false, year_founded: 2006)
@zeek = Developer.create!(name: "Zeekerss", is_indie: true, year_founded: 2023)
@remedy = Developer.create!(name: "Remedy Entertainment", is_indie: false, year_founded: 1995)
@valorant = @riot.games.create!(name: "VALORANT", has_multiplayer: true, year_released: 2020)
@league = @riot.games.create!(name: "League of Legends", has_multiplayer: true, year_released: 2009)
@tft = @riot.games.create!(name: "Teamfight Tactics", has_multiplayer: true, year_released: 2019)
@control = @remedy.games.create!(name: "Control", has_multiplayer: false, year_released: 2019)
@max = @remedy.games.create!(name: "Max Payne", has_multiplayer: false, year_released: 2001)