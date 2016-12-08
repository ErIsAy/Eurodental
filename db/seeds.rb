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


50.times do
  Client.create(name: Faker::Name.name,
                address: Faker::Address.street_address,
                :client_phones_attributes => [:phone => Faker::PhoneNumber.phone_number,
                                             :ptype => "Movil"])
end

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
Worktype.create([{ name: 'Corona', price:1},
                { name: 'Puente', price:1},
                { name: 'Implantes', price:1},
                { name: 'Barra', price:1},
                { name: 'Híbrida', price:1},
                { name: 'Carilla', price:1},
                { name: 'Inlay/Onlay' , price:1},
                { name: 'Inlay Bridge' , price:1},
                { name: 'Lente de contacto', price:1 },
                { name: 'Perno', price:1},
                { name: 'Soldadura Láser', price:1 },
                { name: 'Abutment Personalizado', price:1}])
#
#
# # Material - Items
Material.create([{ name: 'Zirconio', price:1 },
                { name: 'Disilicato', price:1 },
                { name: 'Fedespática', price:1 },
                { name: 'Porcelana', price:1 },
                { name: 'PMMA', price:1 },
                { name: 'Polímero', price:1},
                { name: 'Composite', price:1},
                { name: 'Metal/Pocelana', price:1},
                { name: 'Zirconio/Pocelana', price:1 },
                { name: 'Peek', price:1 },
                { name: 'Cromo cobalto', price:1 },
                { name: 'Titanium', price:1 },
                { name: 'Cromo níquel', price:1 },
                { name: 'Oro', price:1 },
                { name: 'Paladio', price:1 }])


# # Color de muñon - Items
Mcolor.create([{ name: 'Natural', price:1},
                { name: 'Pigmentado', price:1},
                { name: 'Metal', price:1}])

# # Colorimetro - Items
Gcolor.create([{ name: 'Vita Classic', price:1},
                { name: 'Vita 3D master', price:1},
                { name: 'Bioform', price:1},
                { name: 'Chromarcop', price:1 },
                { name: 'Otras', price:1}])


# # Procedimiento - Items
Procedure.create([{ name: 'Fresado/Maquinado', price:1},
                { name: 'Prensado', price:1},
                { name: 'Colado', price:1 }])

# # Metales - Items
# Item.create([{ name: 'Cromo cobalto', price:1, category_id:6 },
#                 { name: 'Titanium', price:1, category_id:6 },
#                 { name: 'Cromo níquel', price:1, category_id:6 },
#                 { name: 'Oro', price:1, category_id:6 },
#                 { name: 'Paladio', price:1, category_id:6 }])
