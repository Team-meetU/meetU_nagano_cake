Admin.create!(
  email: 'admin@admin',
  password: '202020',
  )

Public.create!(
  email: 'public@public',
  password: '123456',
  family_name: '齊道',
  first_name: '信',
  family_name_kana: 'サイドウ',
  first_name_kana: 'シン',
  postal_code: '6527485',
  address: '兵庫県神戸市',
  phone_number: '08088888888',
  is_deleted: 'false',
  )

  Public.create!(
  email: 'michael@michael',
  password: '999999',
  family_name: 'パスワード忘れ',
  first_name: 'マイケル',
  family_name_kana: 'パスワードワスレ',
  first_name_kana: 'マイケル',
  postal_code: '8888888',
  address: 'マイケル星ダブルマインランド',
  phone_number: '01000508846',
  is_deleted: 'false',
  )

  Public.create!(
  email: 'nagano@cake',
  password: '000000',
  family_name: 'ながの',
  first_name: 'けーき',
  family_name_kana: 'ナガノ',
  first_name_kana: 'ケーキ',
  postal_code: '3995479',
  address: '長野県',
  phone_number: '09033824787',
  is_deleted: 'true',
  )

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
