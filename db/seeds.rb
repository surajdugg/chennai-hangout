# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'open-uri'
require 'json'

def populate
	url = "https://maps.googleapis.com/maps/api/place/search/json?location=13.0810,80.2740&radius=50000&types=food&sensor=false&key=AIzaSyAbttZ3P77ZvUkVL2JuomJQOqFzZ48_ALE"
	places = {}
	result = open(url) do |file|
  	places = JSON.parse(file.read)['results']
	end

	places.each do |place|
		p "Adding #{place['name']}"
		record = Place.new(:name => place['name'], :ranking => place['rating'], :city => City.where(:name => "Chennai").first)
		record.save
	end
end

populate