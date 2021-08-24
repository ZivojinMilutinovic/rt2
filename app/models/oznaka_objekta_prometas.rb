class OznakaObjektaPrometas < ApplicationRecord

    NAZIVI_KOLONA=["OznObjPromeneID","NazivOznake","Oznaka(Oznake)"]
    belongs_to :user,class_name:"User",primary_key: :id,foreign_key: :user_id,optional: true

end