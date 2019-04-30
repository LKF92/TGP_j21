require 'faker'
require 'activerecord-reset-pk-sequence'

User.destroy_all
User.reset_pk_sequence

City.destroy_all
City.reset_pk_sequence

Gossip.destroy_all
Gossip.reset_pk_sequence

Tag.destroy_all
Tag.reset_pk_sequence

JoinTagGossip.destroy_all
JoinTagGossip.reset_pk_sequence

10.times do
  my_city = City.create!(name: Faker::Address.city, zip_code: Faker::Address.zip_code)
end

10.times do
  my_user = User.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, description: Faker::TvShows::SouthPark.quote, email: Faker::Internet.email, age: rand(16..40), city: City.all[rand(0..9)])
end

20.times do
  my_gossip = Gossip.create!(title: User.all[rand(0..9)].first_name + " made out with " + User.all[rand(0..9)].first_name, content: Faker::GreekPhilosophers.quote, user: User.all[rand(0..9)])
end

10.times do
  my_tag = Tag.create!(title: "#" + Faker::Hipster.word)
end

10.times do
  my_join_table = JoinTagGossip.create!(tag: Tag.all[rand(0..9)], gossip: Gossip.all[rand(0..19)])
end

10.times do
  my_sender = User.all[rand(0..9)] 
  my_recipient = User.all[rand(0..9)]

  while my_sender == my_recipient #Pcq une personne ne s'envoie pas des messages à elle-meme
    my_recipient = User.all[rand(0..9)]
  end

  my_private_message = PrivateMessage.create!(sender: my_sender, recipient: my_recipient, content: Faker::TvShows::HowIMetYourMother.catch_phrase)
end

puts "ISSOU YATENGAKI"
