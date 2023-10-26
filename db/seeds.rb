require 'faker' 

DogSitter.destroy_all
Chien.destroy_all
Stroll.destroy_all
City.destroy_all
#=> comme ça à chaque phase de test ça ne me génère pas mille instances

city = {
  "Paris" => City.create!(city_name: "Paris"), 
  "Lyon" => City.create!(city_name: "Lyon")
}

dogs_array_paris = []
dogs_array_lyon = []

5.times do |index|
  dog = Chien.create!(
    name: Faker::Creature::Dog.name,
    breed: Faker::Creature::Dog.breed,
    city: city["Paris"]
  )
  dogs_array_paris << dog
end

5.times do |index|
  dog = Chien.create!(
    name: Faker::Creature::Dog.name,
    breed: Faker::Creature::Dog.breed,
    city: city["Lyon"]
  )
  dogs_array_lyon << dog
end

dogsitter_array_paris = []
dogsitter_array_lyon = []

10.times do |index|
  dogsitter = DogSitter.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    city: [city["Paris"], city["Lyon"]].sample
  )
  if dogsitter.city == "Paris"
    dogsitter_array_paris << dogsitter
  else
    dogsitter_array_lyon << dogsitter
  end
end

#c'est là que je fais l'association

# 15.times do |index|
Stroll.create!(
  chien: dogs_array_paris[0],
  dog_sitter: dogsitter_array_paris[0]
)
# end

# 15.times do |index|
#   Stroll.create!(
#     chien: dogs_array_lyon.sample,
#     dog_sitter: dogsitter_array_lyon.sample
#   )
# end
