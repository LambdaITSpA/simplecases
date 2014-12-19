# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
admin = UserType.create name: 'admin', long_name: 'Administrador'
chief_lawyer = UserType.create name: 'chief_lawyer', long_name: 'Abogado Jefe'
assistant = UserType.create name: 'assistant', long_name: 'Asistente'

#Admins
claudio = User.create name: 'Claudio Guerra', user_type: admin, id_number: '1', email: 'claudevandort@gmail.com', password: '12345678', password_confirmation: '12345678'
pato = User.create name: 'Patricio Jara', user_type: admin, id_number: '2', email: 'patricioalfredo18@gmail.com', password: 'qwe12qwe', password_confirmation: 'qwe12qwe'
organization = Organization.create name: 'Admin', id_number: '1234', users: [claudio, pato]

test_lawyer = User.create name: 'Juan Perez', user_type: chief_lawyer, id_number: '3', email: 'juan@perez.com', password: 'juanperez', password_confirmation: 'juanperez'
test_assistant = User.create name: 'Nicolás Vera', user_type: assistant, id_number: '4', email: 'nico@vera.com', password: 'nicovera', password_confirmation: 'nicovera'
test_org = Organization.create name: 'Test Company', id_number: '111', users: [test_lawyer, test_assistant]

#static stuff
#juridica = CauseType.create name: 'Causa Jurídica'
#no_judicial = CauseType.create name: 'Gestión no Judicial'
CauseState.create [{name: 'Ingreso'}, {name: 'Discución', color: 'info'}, {name: 'Prueba', color: 'success'}, {name: 'Sentencia', color: 'danger'}, {name: 'Apelación', color: 'warning'}, {name: 'Archivada', color: 'default'}]
cliente_persona = ClientType.create name: 'Persona'
cliente_empresa = ClientType.create name: 'Empresa'
PaymentState.create [{name: 'Cobrado', color: 'success'}, 
					{name: 'Por cobrar', color: ''}, 
					{name: 'Cobrar hoy', color: 'warning'}, 
					{name: 'Atrasado', color: 'danger'}]
santiago = Region.create name: 'Santiago'
san_miguel = Region.create name: 'San Miguel'
civil = Area.create name: 'Civil'
laboral = Area.create name: 'Laboral'
cobranza = Area.create name: 'Cobranza'
familia = Area.create name: 'Familia'
penal = Area.create name: 'Penal'
Court.create [{name: '1º Juzgado Civil de Santiago', area: civil, region: santiago},
				{name: '2º Juzgado Civil de Santiago', area: civil, region: santiago},
				{name: '3º Juzgado Civil de Santiago', area: civil, region: santiago},
				{name: '4º Juzgado Civil de Santiago', area: civil, region: santiago},
				{name: '5º Juzgado Civil de Santiago', area: civil, region: santiago},
				{name: '6º Juzgado Civil de Santiago', area: civil, region: santiago},
				{name: '7º Juzgado Civil de Santiago', area: civil, region: santiago},
				{name: '8º Juzgado Civil de Santiago', area: civil, region: santiago},
				{name: '9º Juzgado Civil de Santiago', area: civil, region: santiago},
				{name: '10º Juzgado Civil de Santiago', area: civil, region: santiago},
				{name: '11º Juzgado Civil de Santiago', area: civil, region: santiago},
				{name: '12º Juzgado Civil de Santiago', area: civil, region: santiago},
				{name: '13º Juzgado Civil de Santiago', area: civil, region: santiago},
				{name: '14º Juzgado Civil de Santiago', area: civil, region: santiago},
				{name: '15º Juzgado Civil de Santiago', area: civil, region: santiago},
				{name: '16º Juzgado Civil de Santiago', area: civil, region: santiago},
				{name: '17º Juzgado Civil de Santiago', area: civil, region: santiago},
				{name: '18º Juzgado Civil de Santiago', area: civil, region: santiago},
				{name: '19º Juzgado Civil de Santiago', area: civil, region: santiago},
				{name: '20º Juzgado Civil de Santiago', area: civil, region: santiago},
				{name: '21º Juzgado Civil de Santiago', area: civil, region: santiago},
				{name: '22º Juzgado Civil de Santiago', area: civil, region: santiago},
				{name: '23º Juzgado Civil de Santiago', area: civil, region: santiago},
				{name: '24º Juzgado Civil de Santiago', area: civil, region: santiago},
				{name: '25º Juzgado Civil de Santiago', area: civil, region: santiago},
				{name: '26º Juzgado Civil de Santiago', area: civil, region: santiago},
				{name: '27º Juzgado Civil de Santiago', area: civil, region: santiago},
				{name: '28º Juzgado Civil de Santiago', area: civil, region: santiago},
				{name: '29º Juzgado Civil de Santiago', area: civil, region: santiago},
				{name: '30º Juzgado Civil de Santiago', area: civil, region: santiago},
				{name: '1º Juzgado de Letras del Trabajo de Santiago', area: laboral, region: santiago},
				{name: '2º Juzgado de Letras del Trabajo de Santiago', area: laboral, region: santiago},
				{name: 'Juzgado de Cobranza Laboral y Previsional de Santiago', area: cobranza, region: santiago},
				{name: '1º Juzgado de Familia Santiago', area: familia, region: santiago},
				{name: '2º Juzgado de Familia Santiago', area: familia, region: santiago},
				{name: '3º Juzgado de Familia Santiago', area: familia, region: santiago},
				{name: '4º Juzgado de Familia Santiago', area: familia, region: santiago},
				{name: 'Juzgado de Familia Colina', area: familia, region: santiago},
				{name: 'Juzgado de Familia Pudahuel', area: familia, region: santiago},
				{name: 'Centro de Control de Familia', area: familia, region: santiago},
				{name: '1º Juzgado de Garantía de Santiago', area: penal, region: santiago},
				{name: '2º Juzgado de Garantía de Santiago', area: penal, region: santiago},
				{name: '3º Juzgado de Garantía de Santiago', area: penal, region: santiago},
				{name: '4º Juzgado de Garantía de Santiago', area: penal, region: santiago},
				{name: '5º Juzgado de Garantía de Santiago', area: penal, region: santiago},
				{name: '6º Juzgado de Garantía de Santiago', area: penal, region: santiago},
				{name: '7º Juzgado de Garantía de Santiago', area: penal, region: santiago},
				{name: '8º Juzgado de Garantía de Santiago', area: penal, region: santiago},
				{name: '9º Juzgado de Garantía de Santiago', area: penal, region: santiago},
				{name: '13º Juzgado de Garantía de Santiago', area: penal, region: santiago},
				{name: '14º Juzgado de Garantía de Santiago', area: penal, region: santiago},
				{name: 'Juzgado de Garantía de Colina', area: penal, region: santiago},
				{name: '1º Tribunal de Juicio Oral en lo Penal de Santiago', area: penal, region: santiago},
				{name: '2º Tribunal de Juicio Oral en lo Penal de Santiago', area: penal, region: santiago},
				{name: '3º Tribunal de Juicio Oral en lo Penal de Santiago', area: penal, region: santiago},
				{name: '4º Tribunal de Juicio Oral en lo Penal de Santiago', area: penal, region: santiago},
				{name: '5º Tribunal de Juicio Oral en lo Penal de Santiago', area: penal, region: santiago},
				{name: '7º Tribunal de Juicio Oral en lo Penal de Santiago', area: penal, region: santiago},
				{name: 'Tribunal de Juicio Oral en lo Penal Colina', area: penal, region: santiago},
				{name: '1º Juzgado Civil de San Miguel', area: civil, region: san_miguel},
				{name: '2º Juzgado Civil de San Miguel', area: civil, region: san_miguel},
				{name: '3º Juzgado Civil de San Miguel', area: civil, region: san_miguel},
				{name: '4º Juzgado Civil de San Miguel', area: civil, region: san_miguel},
				{name: '1º Juzgado De Letras De Talagante', area: civil, region: san_miguel},
				{name: '2º Juzgado De Letras De Talagante', area: civil, region: san_miguel},
				{name: '1º Juzgado de Letras de Melipilla', area: civil, region: san_miguel},
				{name: '1º Juzgado de Letras de Buin', area: civil, region: san_miguel},
				{name: '2º Juzgado de Letras de Buin', area: civil, region: san_miguel},
				{name: 'Juzgado de Letras de Peñaflor', area: civil, region: san_miguel},
				{name: '1º Juzgado de Letras de San Bernardo', area: civil, region: san_miguel},
				{name: '2º Juzgado de Letras de San Bernardo', area: civil, region: san_miguel},
				{name: '1º Juzgado de Letras de San Bernardo Ex 3°', area: civil, region: san_miguel},
				{name: '2º Juzgado de Letras de San Bernardo Ex 3°', area: civil, region: san_miguel},
				{name: 'Juzgado de Letras del Trabajo de San Miguel', area: laboral, region: san_miguel},
				{name: 'Juzgado de Letras del Trabajo de San Bernardo', area: laboral, region: san_miguel},
				{name: 'Juzgado de Letras del Trabajo de Puente Alto', area: laboral, region: san_miguel},
				{name: 'Juzgado de Cobranza Laboral y Previsional San Miguel', area: cobranza, region: san_miguel},
				{name: '1º Juzgado de Familia San Miguel', area: familia, region: san_miguel},
				{name: '2º Juzgado de Familia San Miguel', area: familia, region: san_miguel},
				{name: 'Juzgado de Familia Buin', area: familia, region: san_miguel},
				{name: 'Juzgado de Familia Melipilla', area: familia, region: san_miguel},
				{name: 'Juzgado de Familia Peñaflor', area: familia, region: san_miguel},
				{name: 'Juzgado de Familia Puente Alto', area: familia, region: san_miguel},
				{name: 'Juzgado de Familia San Bernardo', area: familia, region: san_miguel},
				{name: 'Juzgado de Familia Talagante', area: familia, region: san_miguel},
				{name: '10º Juzgado de Garantía de Santiago', area: penal, region: san_miguel},
				{name: '11º Juzgado de Garantía de Santiago', area: penal, region: san_miguel},
				{name: '12º Juzgado de Garantía de Santiago', area: penal, region: san_miguel},
				{name: '15º Juzgado de Garantía de Santiago', area: penal, region: san_miguel},
				{name: 'Juzgado de Garantía de Puente Alto', area: penal, region: san_miguel},
				{name: 'Juzgado de Garantía de San Bernardo', area: penal, region: san_miguel},
				{name: 'Juzgado de Garantía de Melipilla', area: penal, region: san_miguel},
				{name: 'Juzgado de Garantía de Curacaví', area: penal, region: san_miguel},
				{name: 'Juzgado de Garantía de Talagante', area: penal, region: san_miguel},
				{name: '6º Tribunal de Juicio Oral en lo Penal de Santiago', area: penal, region: san_miguel},
				{name: 'Tribunal de Juicio Oral en lo Penal de Talagante', area: penal, region: san_miguel},
				{name: 'Tribunal de Juicio Oral en lo Penal de Puente Alto', area: penal, region: san_miguel},
				{name: 'Tribunal de Juicio Oral en lo Penal de San Bernardo', area: penal, region: san_miguel},
				{name: 'Tribunal de Juicio Oral en lo Penal de Melipilla', area: penal, region: san_miguel}]

