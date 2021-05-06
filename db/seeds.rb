# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

specialties = ["Osthéologiste", "Dentiste", "Généraliste", "Chirurgien", "Cardiologiste"]

#Boucle création de X docteurs
5.times do 
  doctor = Doctor.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, specialty: specialties.sample.to_s, zip_code: Faker::Address.zip_code)
end

#Boucle création de X patients

10.times do 
  patient = Patient.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name)
end

#Boucle création de X rendez-vous avec un docteur et patient au hasard
10.times do
  rand_id_doctor = rand(1..Doctor.all.length)
  rand_id_patient = rand(1..Patient.all.length)
  appointment = Appointment.create(doctor: Doctor.find(rand_id_doctor), patient: Patient.find(rand_id_patient), date: Faker::Time.between(from: DateTime.now - 87, to: DateTime.now, format: :short))
end

# 3.times do
#   rand_id_doctor = rand(1..Doctor.all.length)
#   rand_id_patient = rand(1..Patient.all.length)
#   rand_id_appointment = rand(1..Appointment.all.length)
#   city = City.create(city_name: Faker::Address.city, appointment: Appointment.find(rand_id_appointment), doctor: Doctor.all(rand_id_doctor), patient: Patient.all(rand_id_patient))
# end