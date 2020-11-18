class Partneri < ApplicationRecord
    NAZIVI_KOLONA=["PartneriID","Opšti podaci","Naziv","Šifra","Tip","Sedište",
        "Adresa","Kontakt","Status","PIB","Tekući","PDV"]
    belongs_to :user,class_name:"User",primary_key: :id,foreign_key: :user_id,optional: true
end