class PoreskeTarife < ApplicationRecord
    NAZIVI_KOLONA=["PorezID","Tarifa","Naziv","Stopa","Početni datum","Završni datum",]
    belongs_to :user,class_name:"User",primary_key: :id,foreign_key: :user_id,optional: true
end