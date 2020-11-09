class Konto3Sintetika < ApplicationRecord
    NAZIVI_KOLONA=["KontoID","GrupaID","Naziv","Konto"]
    belongs_to :user,class_name:"User",primary_key: :id,foreign_key: :user_id,optional: true
end