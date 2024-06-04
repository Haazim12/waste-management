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
Radioelement.create!(
  name: "iode-131",
  half_life: 8.02,
)
Radioelement.create!(
  name: "tc-99m",
  half_life: 0.254167,
)

Radioelement.create!(
  name: "fdg-18",
  half_life: 0.076180556,
)

Tank.create!(
  radioelement_id: 1,
  full_capacity: 1300.0,
  current_capacity: 1300.0,
)
Tank.create!(
  radioelement_id: 2,
  full_capacity: 700.0,
  current_capacity: 700.0,
)
Tank.create!(
  radioelement_id: 3,
  full_capacity: 300.0,
  current_capacity: 300.0,
)
Examination.create!(
  exam_type: "pet-scan",
  volume: 1.5,
)
Examination.create!(
  exam_type: "irratherapie",
  volume: 40.0,
)
Examination.create!(
  exam_type: "scintigraphie",
  volume: 1.5,
)
# Waste.create!(
#   reg_number: "A1",
#   waste_type: "Solide",
#   radioelement: "iode-131",
#   activity: 4.0,
#   half_life: 0.00001,
#   infectious: true,
# )
# Waste.create!(
#   reg_number: "A3",
#   waste_type: "Solide",
#   radioelement: "exemple",
#   activity: 1.0,
#   half_life: 0.2,
#   infectious: false,

# )
# Waste.create!(
#   reg_number: "A2",
#   waste_type: "Liquide",
#   radioelement: "iode-131",
#   activity: 2.0,
#   half_life: 0.0001,
#   examination_id: 1,
#   tank_id: 1,
# )
# Waste.create!(
#   reg_number: "A4",
#   waste_type: "Liquide",
#   radioelement: "TC-99m",
#   activity: 1.0,
#   half_life: 1.0,
#   examination_id: 2,
#   tank_id: 2,
# )
# Waste.create!(
#   reg_number: "A5",
#   waste_type: "Liquide",
#   radioelement: "FDG",
#   activity: 1.0,
#   half_life: 1.0,
#   examination_id: 3,
#   tank_id: 3,
# )

puts "#{Tank.count} tanks created"
puts "#{Radioelement.count} radioelements created"
puts "#{Examination.count} examinations created"
puts "#{User.count} users created"
puts "#{Waste.count} Wastes created"
