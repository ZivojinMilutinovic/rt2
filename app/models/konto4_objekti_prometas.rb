class Konto4ObjektiPrometas < ApplicationRecord
    NAZIVI_KOLONA=["ObjekatID","SintetikaID","Naziv","Sifra 4. broj","Objekat","Tip","Ispravka"]
    belongs_to :user,class_name:"User",primary_key: :id,foreign_key: :user_id,optional: true
end