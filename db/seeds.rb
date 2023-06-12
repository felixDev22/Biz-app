# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)



User.create(name: 'Felix', email: 'felixdev@gmail.com', password: 'test12345')
icon = fixture_file_upload(Rails.root.join('spec/fixtures/icons/uber.png'), 'image/png')
Category.create(name: 'Travel', icon:, user_id: @user.id)
Transaction.create(name: 'Nairobi', amount: 380, author_id:  @user.id, category_id: @category.id)
