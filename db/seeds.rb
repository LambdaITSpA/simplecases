# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
claudio = User.create name: 'Claudio Guerra', id_number: '1', email: 'claudevandort@gmail.com', password: '12345678', password_confirmation: '12345678'
pato = User.create name: 'Patricio Jara', id_number: '2', email: 'patricioalfredo18@gmail.com', password: 'qwe12qwe', password_confirmation: 'qwe12qwe'
organization = Organization.create name: 'Admin', id_number: '1234', users: [claudio, pato]