# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

100.times do
  todo_list = TodoList.create(title: Faker::Job.title, description: Faker::Lorem.sentences(3).join)
  10.times do |i|
    todo_list.todo_items.create(content: Faker::Lorem.sentence, deadline: Time.now + i.days)
  end
end
