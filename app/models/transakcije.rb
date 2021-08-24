class Transakcije < ApplicationRecord
    NAZIVI_KOLONA=["TransakcijeID","Rbr","Grupa","Naziv","Oporezivo"]
    belongs_to :user,class_name:"User",primary_key: :id,foreign_key: :user_id,optional: true

end