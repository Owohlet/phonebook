# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create([
	{fullname: "Naruto Uzumaki", email: "n.uzumaki@gmail.com", password: "1234567890", username: "thelasttail"},
	{fullname: "Hinata Hyyuga", email: "h.hyyuga@gmail.com", password: "1234567890", username: "eyesforthedark"}
])
