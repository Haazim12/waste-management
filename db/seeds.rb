# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

User.create!(
  email: "ourrachhatim0@gmail.com",
  cin: "EE",
  first_name: "Hatim",
  last_name: "Ourrach",
  phone_number: "0666666666",
  password: "password",
  password_confirmation: "password",
)
Tank.create!(
  radioelement: "iode-131",
  full_capacity: 1300.0,
  current_capacity: 1300.0,
)
Tank.create!(
  radioelement: "TC-99m",
  full_capacity: 700.0,
  current_capacity: 700.0,
)
Tank.create!(
  radioelement: "FDG-",
  full_capacity: 300.0,
  current_capacity: 300.0,
)
Waste.create!(
  reg_number: "A1",
  waste_type: "Solide",
  activity: 4.0,
  half_life: 0.5,
)
Waste.create!(
  reg_number: "A2",
  waste_type: "Liquide",
  activity: 2.0,
  half_life: 0.1,
  tank_id: 1,
)
Waste.create!(
  reg_number: "A3",
  waste_type: "solide",
  activity: 1.0,
  half_life: 0.2,
)
Waste.create!(
  reg_number: "A4",
  waste_type: "Liquide",
  activity: 1.0,
  half_life: 1.0,
  tank_id: 2,
)

puts "#{User.count} users created"
puts "#{Waste.count} Wastes created"
