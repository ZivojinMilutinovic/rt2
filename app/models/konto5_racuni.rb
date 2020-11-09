class Konto5Racuni < ApplicationRecord
    NAZIVI_KOLONA=["RacunID","ObjekatID","Naziv","Analitika","Pozicija kontrolna sifra ispravka"]
    belongs_to :user,class_name:"User",primary_key: :id,foreign_key: :user_id,optional: true

end