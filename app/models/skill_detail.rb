class SkillDetail < ApplicationRecord
  self.inheritance_column = :_type_disabled # この行を追加
  belongs_to :monster_detail
  belongs_to :skill_datum
end
