class MonsterDetail < ApplicationRecord
  self.inheritance_column = :_type_disabled # この行を追加
  belongs_to :user
  belongs_to :monster_datum
end
