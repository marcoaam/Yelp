# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Restaurant.destroy_all
Review.destroy_all

wasabi = Restaurant.create(name: 'Wasabi')
wasabi.reviews.create(thoughts: 'bad', rating: 1)
wasabi.reviews.create(thoughts: 'good', rating: 3)
wasabi.reviews.create(thoughts: 'ok', rating: 4)
wasabi.reviews.create(thoughts: 'poor', rating: 2)
wasabi.reviews.create(thoughts: 'great', rating: 5)

kfc = Restaurant.create(name: 'KFC')
kfc.reviews.create(thoughts: 'Really poor', rating: 2)
kfc.reviews.create(thoughts: 'Really good', rating: 4)
kfc.reviews.create(thoughts: 'Really Great', rating: 5)
kfc.reviews.create(thoughts: 'Really bad', rating: 1)
kfc.reviews.create(thoughts: 'Really OK', rating: 3)

nandos = Restaurant.create(name: 'Nandos')
nandos.reviews.create(thoughts: 'Really bad', rating: 1)
nandos.reviews.create(thoughts: 'Really Great', rating: 5)
nandos.reviews.create(thoughts: 'Really OK', rating: 3)
nandos.reviews.create(thoughts: 'Really good', rating: 4)
nandos.reviews.create(thoughts: 'Really poor', rating: 2)