# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


unless AdminUser.find_by(login_name: 'admin_leng')
  AdminUser.create!login_name: 'admin_leng', password: 'admin_leng!', password_confirmation: 'admin_leng!!', phone: '15275200369', nickname: '冷传宝', grade: 1
end