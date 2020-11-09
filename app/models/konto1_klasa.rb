class Konto1Klasa < ApplicationRecord
NAZIVI_KOLONA=["KlasaID","Naziv","Klasa","Bilans","Aktivnost"]

    belongs_to :user,class_name:"User",primary_key: :id,foreign_key: :user_id,optional: true
end