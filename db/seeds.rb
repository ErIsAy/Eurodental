# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   áéíóú
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


User.create(email: 'admin@admin.com', password: '123456789', role_level: 1)



Category.create([{ name: 'Tipo de Trabajo'},
                { name: 'Material'},
                { name: 'Color de Muñon'},
                { name: 'Colorímetro'},
                { name: 'Procedimiento'},
                { name: 'Metales'}])

# Tipo de Trabajo - Items
Item.create([{ name: 'Corona', price:1, category_id:1 },
                { name: 'Puente', price:1, category_id:1 },
                { name: 'Implantes', price:1, category_id:1 },
                { name: 'Barra', price:1, category_id:1 },
                { name: 'Híbrida', price:1, category_id:1 },
                { name: 'Carilla', price:1, category_id:1 },
                { name: 'Inlay/Onlay', price:1, category_id:1 },
                { name: 'Inlay Bridge', price:1, category_id:1 },
                { name: 'Lente de contacto', price:1, category_id:1 },
                { name: 'Perno', price:1, category_id:1 },
                { name: 'Soldadura Láser', price:1, category_id:1 }])


# Material - Items
Item.create([{ name: 'Zirconio', price:1, category_id:2 },
                { name: 'Disilicato', price:1, category_id:2 },
                { name: 'Fedespática', price:1, category_id:2 },
                { name: 'Porcelana', price:1, category_id:2 },
                { name: 'PMMA', price:1, category_id:2 },
                { name: 'Polímero', price:1, category_id:2 },
                { name: 'Composite', price:1, category_id:2 },
                { name: 'Metal/Pocelana', price:1, category_id:2 },
                { name: 'Zirconio/Pocelana', price:1, category_id:2 },
                { name: 'Peek', price:1, category_id:2 }])


# Color de muñon - Items
Item.create([{ name: 'Natural', price:1, category_id:3 },
                { name: 'Pimentado', price:1, category_id:3 },
                { name: 'Metal', price:1, category_id:3 }])

# Colorimetro - Items
Item.create([{ name: 'Vita Classic', price:1, category_id:4 },
                { name: 'Vita 3D master', price:1, category_id:4 },
                { name: 'Bioform', price:1, category_id:4 },
                { name: 'Chromarcop', price:1, category_id:4 },
                { name: 'Otras', price:1, category_id:4 }])


# Procedimiento - Items
Item.create([{ name: 'Fresado/Maquinado', price:1, category_id:5 },
                { name: 'Prensado', price:1, category_id:5 },
                { name: 'Colado', price:1, category_id:5 }])

# Metales - Items
Item.create([{ name: 'Cromo cobalto', price:1, category_id:6 },
                { name: 'Titanium', price:1, category_id:6 },
                { name: 'Cromo níquel', price:1, category_id:6 },
                { name: 'Oro', price:1, category_id:6 },
                { name: 'Paladio', price:1, category_id:6 }])
