require 'faker' 

DogSitter.destroy_all
Chien.destroy_all
Stroll.destroy_all
City.destroy_all
#=> comme ça à chaque phase de test ça ne me génère pas mille instances

5.times do |index|
  City.create!(
    city_name: Faker::Address.city
   )
end

10.times do |index|
  Chien.create!(
    name: Faker::Creature::Dog.name,
    breed: Faker::Creature::Dog.breed,
    city: City.all.sample)
end

10.times do |index|
  DogSitter.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    city: City.all.sample)

end

30.times do |index|
  Stroll.create!(
    chien: Chien.all.sample,
    dog_sitter: DogSitter.all.sample
  )
end