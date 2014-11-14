# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#Admins
claudio = User.create name: 'Claudio Guerra', id_number: '1', email: 'claudevandort@gmail.com', password: '12345678', password_confirmation: '12345678'
pato = User.create name: 'Patricio Jara', id_number: '2', email: 'patricioalfredo18@gmail.com', password: 'qwe12qwe', password_confirmation: 'qwe12qwe'
organization = Organization.create name: 'Admin', id_number: '1234', users: [claudio, pato]

#static stuff
#juridica = CauseType.create name: 'Causa Jurídica'
#no_judicial = CauseType.create name: 'Gestión no Judicial'
CauseState.create [{name: 'Ingreso'}, {name: 'Discución'}, {name: 'Prueba'}, {name: 'Sentencia'}, {name: 'Apelación'}, {name: 'Archivada'}]
cliente_persona = ClientType.create name: 'Persona'
cliente_empresa = ClientType.create name: 'Empresa'
rm = Region.create name: 'Santiago'
areas = Area.create [{name: 'Civil'}, {name: 'Laboral'}, {name: 'Cobranza'}, {name: 'Familia'}, {name: 'Penal'}, {name: 'Protección'}]
court = Court.create name: '1° Tribunal Civil', area: areas[0], region: rm
court = Court.create name: '1° Tribunal Laboral', area: areas[1], region: rm
court = Court.create name: '1° Tribunal de Familia', area: areas[3], region: rm

cliente = Client.create id_number:'1-9', client_type: cliente_persona
persona = Person.create name: 'Persona', email: 'persona@gmail.com', address: 'dirección 123', client: cliente

test_user = User.create name: 'Juan Perez', id_number: '3', email: 'juan@perez.com', password: 'juanperez', password_confirmation: 'juanperez'
test_org = Organization.create name: 'Test Company', id_number: '111', users: [test_user]
