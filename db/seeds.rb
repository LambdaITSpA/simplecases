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

#Profiles
#puts 'LOL!'
all = Subject.create name: 'Todo', class_name: ':all'
causas = Subject.create name: 'Causas', class_name: 'Cause'
avances = Subject.create name: 'Avances', class_name: 'JournalEntry'
pagos = Subject.create name: 'Pagos', class_name: 'Payment'

manage = Action.create long_name: 'Administrar', name: 'manage'

manage_all = Permission.create subject: all, action: manage
manage_causes = Permission.create subject: causas, action: manage
manage_je = Permission.create subject: avances, action: manage
manage_payments = Permission.create subject: pagos, action: manage

sudo_profile = Profile.create long_name: 'Super Administrador', name: 'sudo', permissions: [manage_all]
organization_admin_profile = Profile.create long_name: 'Administrador', name: 'admin', permissions: [manage_causes, manage_je, manage_payments]
lawyer_profile = Profile.create long_name: 'Abogado', name: 'lawyer', permissions: [manage_causes, manage_je]
executive_profile = Profile.create long_name: 'Ejecutivo', name: 'executive', permissions: [manage_payments]


Setting.create [{long_name: 'Cantidad de Casos', name: 'cases_quantity'},
	{long_name: 'Cantidad de Clientes', name: 'clients_quantity'},
	{long_name: 'Cantidad Causas Civiles', name: 'civil_cases_quantity'},
	{long_name: 'cantidad de causas laboral', name: 'laboral_cases_quantity'},
	{long_name: 'cantidad de causas Cobranza', name: 'cobranza_cases_quantity'},
	{long_name: 'cantidad de causas Familia', name: 'familia_cases_quantity'},
	{long_name: 'cantidad de causas Penal', name: 'penal_cases_quantity'},
	{long_name: 'cantidad de causas General', name: 'General_cases_quantity'}]

test_org = Organization.create name: 'Test Company', id_number: '111', profiles: [organization_admin_profile, lawyer_profile, executive_profile]
admin_org = Organization.create name: 'Admin', id_number: '1234', profiles: [sudo_profile]

sudo_op = OrganizationProfile.find_by_organization_id_and_profile_id admin_org.id, sudo_profile
admin_op = OrganizationProfile.find_by_organization_id_and_profile_id test_org.id, organization_admin_profile.id
lawyer_op = OrganizationProfile.find_by_organization_id_and_profile_id test_org.id, lawyer_profile.id
executive_op = OrganizationProfile.find_by_organization_id_and_profile_id test_org.id, executive_profile.id

#Admins
claudio = User.create name: 'Claudio Guerra', user_type: admin, id_number: '1', email: 'claudevandort@gmail.com', password: '12345678', password_confirmation: '12345678', organization_profile: sudo_op
pato = User.create name: 'Patricio Jara', user_type: admin, id_number: '2', email: 'patricioalfredo18@gmail.com', password: 'qwe12qwe', password_confirmation: 'qwe12qwe', organization_profile: sudo_op

test_lawyer = User.create name: 'Juan Perez', user_type: chief_lawyer, id_number: '3', email: 'juan@perez.com', password: 'juanperez', password_confirmation: 'juanperez', organization_profile: admin_op
test_assistant = User.create name: 'Nicolás Vera', user_type: assistant, id_number: '4', email: 'nico@vera.com', password: 'nicovera', password_confirmation: 'nicovera', organization_profile: lawyer_op
test_org.update users: [test_lawyer, test_assistant]
admin_org.update users: [claudio, pato]

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
general = Area.create name: 'General'
supr_apel = Area.create name: 'Corte Suprema/Apelaciones'
Court.create [	{name: 'Corte Suprema', area: supr_apel, region: santiago},
				{name: 'Corte de Apelaciones de Santiago', area: supr_apel, region: santiago},
				{name: 'Corte de Apelaciones de San Miguel', area: supr_apel, region: santiago},
				{name: '1º Juzgado Civil de Santiago', area: civil, region: santiago},
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
				{name: 'Tribunal de Juicio Oral en lo Penal de Melipilla', area: penal, region: san_miguel},
				{name: 'Sin Tribunal', area: general, region: santiago}]

