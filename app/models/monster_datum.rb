class MonsterDatum < ApplicationRecord
  self.inheritance_column = :_type_disabled # この行を追加
end
