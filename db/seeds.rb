# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

date = ['one', 'two', 'three', 'gour', 'sfasdf', 'safdasjk', 'safas', 'sfsjk', 'ten', 'white', 'black', 'osaka', 'higashioosaka', 'midori', 'kurumi', 'coffee', 'sun', 'right', 'black', 'glay']

for i in 1..100 do
    DataPage.create date: date.sample
end

# $ rails db:seed