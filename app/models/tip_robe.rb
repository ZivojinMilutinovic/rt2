class TipRobe < ApplicationRecord
    NAZIVI_KOLONA=["TipRobeID","Naziv","Oznaka"]
    belongs_to :user,class_name:"User",primary_key: :id,foreign_key: :user_id,optional: true

end