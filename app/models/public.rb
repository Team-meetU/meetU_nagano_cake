class Public < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :family_name, presence: true, length: {maximum:20}
  validates :first_name, presence: true, length: {maximum:20}
  validates :family_name_kana, presence: true, length: {maximum:50}
  validates :family_name_kana, presence: true, length: {maximum:50}
  validates :postal_code, presence: true, length: {minimum:7, maximum:7}
  validates :address, presence: true, length: {maximum:300}
  validates :phone_number, length: {minimum:9, maximum:11}

  has_many :cart_items, dependent: :destroy
  has_many :addresses, dependent: :destroy
  has_many :orders, dependent: :destroy

  # is_deletedがfalseならtrueを返すようにしている
  def active_for_authentication?
    super && (is_deleted == false)
  end
end
