# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
5.times { |i| Post.create(title: "Market News #{i}", text: "This is text nr #{i}") }
6.times { |i| Post.create(title: "Post #{i}", text: 'Blablablablalbalbal') }

10.times do
  Post.create(title: "Don't know what is the title",
              text: 'But the body of this post well... un none either')
end

10.times do |i|
  Post.create(title: "citation #{i}",
              text: 'Make it as simple as possible, but not simpler.')
end
