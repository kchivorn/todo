# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

TodoItem.delete_all
TodoList.delete_all

100.times do
  todo_list = TodoList.new(title: Faker::Job.title, description: Faker::Lorem.sentences(3).join)
  todo_list.save! rescue next
  if todo_list
    puts todo_list.title
    10.times do |i|
      todo_list.todo_items.create(content: Faker::Lorem.sentence, deadline: Time.now + i.days)
    end
  end
end
