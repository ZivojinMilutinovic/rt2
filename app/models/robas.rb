class Robas < ApplicationRecord
    NAZIVI_KOLONA=["RobaID","AnalitikaRačunaID","Naziv","Šifra","Oznaka","KatBroj",
        "JedMere","Poreska tarifa","Pakovanje",]
    belongs_to :user,class_name:"User",primary_key: :id,foreign_key: :user_id,optional: true
end