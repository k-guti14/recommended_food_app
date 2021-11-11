# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# User.create!(email: "test@example.com", password: "password")
# puts "ユーザーの初期データインポートに成功しました。"

email = "test@example.com"
password = "password"

# users テーブルを再生成（関連付いたテーブルを含む）
ActiveRecord::Base.connection.execute("TRUNCATE TABLE users RESTART IDENTITY CASCADE")

# 以下，開発用の初期データ
user1 = User.create!(email: "satou@example.com", password: "password")
user2 = User.create!(email: "suzuki@example.com", password: "password")
user3 = User.create!(email: "tanaka@example.com", password: "password")

food1 = user2.foods.create!(name: "沖縄そば")
food2 = user1.foods.create!(name: "海ぶどう")
food3 = user3.foods.create!(name: "ゴーヤーチャンプルー")
food4 = user3.foods.create!(name: "サーターアンダギー")
food5 = user1.foods.create!(name: "タコライス")

food1.likes.create!(user_id: user1.id)
food1.likes.create!(user_id: user3.id)
food2.likes.create!(user_id: user2.id)
food3.likes.create!(user_id: user1.id)
food4.likes.create!(user_id: user1.id)
food4.likes.create!(user_id: user2.id)
food5.likes.create!(user_id: user3.id)

# ログイン時に使用するアカウント（変数への代入は不要）
User.create!(email: email, password: password)

puts "初期データの投入に成功しました！"
