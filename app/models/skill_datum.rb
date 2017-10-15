class SkillDatum < ApplicationRecord
  self.inheritance_column = :_type_disabled # この行を追加
  has_many :skill_detail
end
