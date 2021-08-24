class TransakcijeGrupe < ApplicationRecord
        NAZIVI_KOLONA=["GrupaID","Rbr","Oblast","Naziv"]
        belongs_to :user,class_name:"User",primary_key: :id,foreign_key: :user_id,optional: true
end