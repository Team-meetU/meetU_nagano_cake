  Admin.create!(
  id: '1',
  email: 'admin@admin',
  password: '202020',
  )

  Public.create!(
  id: '1',
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
  id: '2',
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
  id: '3',
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

  Order.create!(
  id: '1',
  public_id: '1',
  postal_code: '6527485',
  delivery_address: '兵庫県神戸市',
  delivery_name: '齊道',
  method_of_payment: '0',
  status: '2',
  total_price: '3300',
  delivery_charge: '800',
  )

  Order.create!(
  id: '2',
  public_id: '2',
  postal_code: '8888888',
  delivery_address: 'マイケル星ダブルマインランド',
  delivery_name: 'マイケル',
  method_of_payment: '1',
  status: '0',
  total_price: '4290',
  delivery_charge: '800',
  )

  OrderDetail.create!(
  id: '1',
  item_id: '1',
  order_id: '1',
  quantity: '1',
  price: '3300',
  making_status: '2',
  )

  OrderDetail.create!(
  id: '2',
  item_id: '1',
  order_id: '2',
  quantity: '1',
  price: '3300',
  making_status: '0',
  )

  OrderDetail.create!(
  id: '3',
  item_id: '2',
  order_id: '2',
  quantity: '3',
  price: '330',
  making_status: '0',
  )

  Item.create!(
  id: '1',
  genre_id: '1',
  name: 'spcake1',
  explanation: '期間限定のスペシャルケーキ',
  price: '3000',
  is_stock: 'ture'
  )

  Item.create!(
  id: '2',
  genre_id: '2',
  name: '甘くておいしいチョコクッキー',
  explanation: '当店のイチオシです',
  price: '300',
  is_stock: 'ture'
  )


  Genre.create!(
  id: '1',
  name: "ケーキ"
  )

  Genre.create!(
  id: '2',
  name: "クッキー"
  )
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
