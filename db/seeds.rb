# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   áéíóú
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'faker'

User.create(email: 'admin@admin.com', password: '123456789', role_level: 1, admin: true)


# 50.times do
#   Client.create(name: Faker::Name.name,
#                 phone: Faker::PhoneNumber.phone_number,
#                 address: Faker::Address.street_address,
#                 email: Faker::Internet.free_email)
# end

# phones = ClientPhone.new :phone => Faker::PhoneNumber.phone_number,
#                              :ptype => "Movil"

# 
# 50.times do
#   Client.create(name: Faker::Name.name,
#                 address: Faker::Address.street_address,
#                 :client_phones_attributes => [:phone => Faker::PhoneNumber.phone_number,
#                                              :ptype => "Movil"])
# end

Price.create

#
# Client.create()
#
# json.extract! @client, :id, :name, :phone, :address, :email, :created_at, :updated_at

#
# Category.create([{ name: 'Tipo de Trabajo'},
#                 { name: 'Material'},
#                 { name: 'Color de Muñon'},
#                 { name: 'Colorímetro'},
#                 { name: 'Procedimiento'},
#                 { name: 'Metales'}])
#
# # Tipo de Trabajo - Items
Worktype.create([{ name: 'Corona', price:0},
                { name: 'Puente', price:0},
                { name: 'Implantes', price:0},
                { name: 'Barra', price:0},
                { name: 'Híbrida', price:0},
                { name: 'Carilla', price:0},
                { name: 'Inlay/Onlay' , price:0},
                { name: 'Inlay Bridge' , price:0},
                { name: 'Lente de contacto', price:0 },
                { name: 'Perno', price:0},
                { name: 'Soldadura Láser', price:0 },
                { name: 'Abutment Personalizado', price:0}])
#
#
# # Material - Items
Material.create([{ name: 'Zirconio', price:0 },
                { name: 'Disilicato', price:0 },
                { name: 'Fedespática', price:0 },
                { name: 'Porcelana', price:0 },
                { name: 'PMMA', price:0 },
                { name: 'Polímero', price:0},
                { name: 'Composite', price:0},
                { name: 'Metal/Pocelana', price:0},
                { name: 'Zirconio/Pocelana', price:0 },
                { name: 'Peek', price:0 },
                { name: 'Cromo cobalto', price:0 },
                { name: 'Titanium', price:0 },
                { name: 'Cromo níquel', price:0 },
                { name: 'Oro', price:0 },
                { name: 'Paladio', price:0 }])


# # Color de muñon - Items
Mcolor.create([{ name: 'Natural', price:0},
                { name: 'Pigmentado', price:0},
                { name: 'Metal', price:0}])

# # Colorimetro - Items
Gcolor.create([{ name: 'Vita Classic', price:0},
                { name: 'Vita 3D master', price:0},
                { name: 'Bioform', price:0},
                { name: 'Chromarcop', price:0 },
                { name: 'Otras', price:0}])


# # Procedimiento - Items
Procedure.create([{ name: 'Fresado/Maquinado', price:0},
                { name: 'Prensado', price:0},
                { name: 'Colado', price:0 }])

# # Metales - Items
# Item.create([{ name: 'Cromo cobalto', price:0, category_id:6 },
#                 { name: 'Titanium', price:0, category_id:6 },
#                 { name: 'Cromo níquel', price:0, category_id:6 },
#                 { name: 'Oro', price:0, category_id:6 },
#                 { name: 'Paladio', price:0, category_id:6 }])
