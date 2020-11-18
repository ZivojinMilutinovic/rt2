class Magacini < ApplicationRecord
    NAZIVI_KOLONA=["MagaciniID","ObjektiID","Naziv","Zalihe","Adresa",
        "Lokacija","Šifra","Konto","Oznaka",]
        belongs_to :user,class_name:"User",primary_key: :id,foreign_key: :user_id,optional: true
end