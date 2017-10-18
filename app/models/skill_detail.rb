class SkillDetail < ApplicationRecord
  self.inheritance_column = :_type_disabled # この行を追加
  validates :pp_left, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  belongs_to :monster_detail
  belongs_to :skill_datum
end
