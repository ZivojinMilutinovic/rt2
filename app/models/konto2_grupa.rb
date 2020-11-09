class Konto2Grupa < ApplicationRecord
    NAZIVI_KOLONA=["GrupaID","KlasaID","Naziv","Grupa"]
    belongs_to :user,class_name:"User",primary_key: :id,foreign_key: :user_id,optional: true
end