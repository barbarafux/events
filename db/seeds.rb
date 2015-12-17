# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# 57.times do |i|
#   Event.create([{
#   	name: "Lipsum Post #{i}",
#   	start_date: DateTime.new("09/01/2016 17:00"),
#   	end_date: DateTime.new("10/01/2016 19:00"),
#   	city: "#{i}"}])
# end

#Event.destroy_all

# 15.times do |i|
#   Event.create!(name: "Event #{i+35}",
#                 start_date: (rand*300).days.from_now,
#                 end_date: (rand*300).days.from_now,
#                 website: "",
#                 city_id: rand(1..55))
# end


# cities = City.create([
# { name: 'Alicante', country: 'Spain', continent: 'Europe' },
# { name: 'Amsterdam', country: 'Netherlands', continent: 'Europe' },
# { name: 'Barcelona', country: 'Spain', continent: 'Europe' },
# { name: 'Berlin', country: 'Germany', continent: 'Europe' },
# { name: 'Bilbao', country: 'Spain', continent: 'Europe' },
# { name: 'Birmingham', country: 'United Kingdom', continent: 'Europe' },
# { name: 'Bologna', country: 'Italy', continent: 'Europe' },
# { name: 'Bratislava', country: 'Slovakia', continent: 'Europe' },
# { name: 'Brno', country: 'Czech Republic', continent: 'Europe' },
# { name: 'Bucharest', country: 'Romania', continent: 'Europe' },
# { name: 'Budapest', country: 'Hungary', continent: 'Europe' },
# { name: 'Cologne', country: 'Germany', continent: 'Europe' },
# { name: 'Dortmund', country: 'Germany', continent: 'Europe' },
# { name: 'Dresden', country: 'Germany', continent: 'Europe' },
# { name: 'Dublin', country: 'Ireland', continent: 'Europe' },
# { name: 'Duisburg', country: 'Germany', continent: 'Europe' },
# { name: 'Düsseldorf', country: 'Germany', continent: 'Europe' },
# { name: 'Essen', country: 'Germany', continent: 'Europe' },
# { name: 'Florence', country: 'Italy', continent: 'Europe' },
# { name: 'Gdańsk', country: 'Poland', continent: 'Europe' },
# { name: 'Genoa', country: 'Italy', continent: 'Europe' },
# { name: 'Glasgow', country: 'United Kingdom', continent: 'Europe' },
# { name: 'Hamburg', country: 'Germany', continent: 'Europe' },
# { name: 'Hanover', country: 'Germany', continent: 'Europe' },
# { name: 'Helsinki', country: 'Finland', continent: 'Europe' },
# { name: 'Kraków', country: 'Poland', continent: 'Europe' },
# { name: 'Las Palmas de Gran Canaria', country: 'Spain', continent: 'Europe' },
# { name: 'Leeds', country: 'United Kingdom', continent: 'Europe' },
# { name: 'Lisbon', country: 'Portugal', continent: 'Europe' },
# { name: 'Łódź', country: 'Poland', continent: 'Europe' },
# { name: 'Lyon', country: 'France', continent: 'Europe' },
# { name: 'Madrid', country: 'Spain', continent: 'Europe' },
# { name: 'Málaga', country: 'Spain', continent: 'Europe' },
# { name: 'Marseille', country: 'France', continent: 'Europe' },
# { name: 'Milan', country: 'Italy', continent: 'Europe' },
# { name: 'Munich', country: 'Germany', continent: 'Europe' },
# { name: 'Murcia', country: 'Spain', continent: 'Europe' },
# { name: 'Naples', country: 'Italy', continent: 'Europe' },
# { name: 'Nice', country: 'France', continent: 'Europe' },
# { name: 'Nuremberg', country: 'Germany', continent: 'Europe' },
# { name: 'Palermo', country: 'Italy', continent: 'Europe' },
# { name: 'Palma de Mallorca', country: 'Spain', continent: 'Europe' },
# { name: 'Paris', country: 'France', continent: 'Europe' },
# { name: 'Plovdiv', country: 'Bulgary', continent: 'Europe' },
# { name: 'Prague', country: 'Czech Republic', continent: 'Europe' },
# { name: 'Rome', country: 'Italy', continent: 'Europe' },
# { name: 'Sofia', country: 'Italy', continent: 'Europe' },
# { name: 'Stockholm', country: 'Bulgary', continent: 'Europe' },
# { name: 'Stuttgart', country: 'Germany', continent: 'Europe' },
# { name: 'Toulouse', country: 'France', continent: 'Europe' },
# { name: 'Turin', country: 'Italy', continent: 'Europe' },
# { name: 'Valencia', country: 'Spain', continent: 'Europe' },
# { name: 'Varna', country: 'Bulgary', continent: 'Europe' },
# { name: 'Vienna', country: 'Austria', continent: 'Europe' },
# { name: 'Warsaw', country: 'Poland', continent: 'Europe' },
# { name: 'Wrocław', country: 'Poland', continent: 'Europe' },
# { name: 'Zaragoza', country: 'Spain', continent: 'Europe' }])