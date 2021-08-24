class Promene < ApplicationRecord
    NAZIVI_KOLONA=["PromenaID","PromenaTipNaziv","Naziv","PDVOdbitak","KŠ"]
    belongs_to :user,class_name:"User",primary_key: :id,foreign_key: :user_id,optional: true
end