# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "faker"
require "set"

100.times { User.create({
  username: Faker::Name.unique.name,
})}

20.times { Artwork.create({
  title: Faker::Music.album,
  img_url: Faker::Internet.domain_name,
  artist_id: (1..100).to_a.sample
})}
array = Set.new
200.times {
  array << [(1..100).to_a.sample, (1..20).to_a.sample]
}
array.each do |sub_array|
  ArtworkShare.create({
    viewer_id: sub_array[0],
    artwork_id: sub_array[1]
  })
end




