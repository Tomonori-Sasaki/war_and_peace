class MonsterDetail < ApplicationRecord
  self.inheritance_column = :_type_disabled # この行を追加
  validates :hp_left, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  belongs_to :user
  belongs_to :monster_datum
  has_many :skill_detail
end
