json.extract! monster_datum, :id, :name, :type, :hp, :attack, :defence, :speed, :hp_add, :attack_add, :defence_add, :speed_add, :level, :exp, :tech1, :tech2, :tech3, :tech4, :region_id, :image_name, :created_at, :updated_at
json.url monster_datum_url(monster_datum, format: :json)
