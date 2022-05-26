# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

parent_name = ["Кухня", "Гостинная", "Спальня", "Коридор", "Ванная комната"]
position_parent = parent_name.map{ |name| Position.create!(name: name, kind: Position.aasm.events.map(&:name).sample) }
children_name = ["Столы", "Стулья", "Кровати", "Зановески", "Душевая Кабина"]
children = position_parent.map{ |parent|  children_name.map { |name| Position.create!(name: name, parent: parent, kind: Position.aasm.events.map(&:name).sample) }}
children_menu_name = ["Цвета", "Материалы"]
children.flatten.map{|parent| children_menu_name.map { |name|  Position.create!(name: name, parent: parent, kind: Position.aasm.events.map(&:name).sample) }}
color_menu_name = ["Красный", "Синий", "Зеленый"]
Position.where(name: "Цвета").find_each{ |parent| color_menu_name.map { |name| Position.create!(name: name, parent: parent,kind: Position.aasm.events.map(&:name).sample) }}
