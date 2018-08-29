# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

500.times do
  r = (3..10).to_a.sample
  art = Article.new(
    title: Faker::Book.title,
    content: Faker::Lorem.paragraphs(r),
    user_id: [1, 2].sample
  )

  match = Article.find_by(title: art.title)
  art.save unless match
end
