class User < ApplicationRecord
  validates :name, {presence: true, length: { maximum: 5 }}
  validates :email, {presence: true, uniqueness: true}
  validates :password, presence: true

  has_many :monster_detail
end
