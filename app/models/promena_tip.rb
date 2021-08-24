class PromenaTip < ApplicationRecord
    NAZIVI_KOLONA=["PromTipID","Transakcija","NazivPromeneTip","OdobrenjeLabela","Zaduženje labela","DupliStav",
    "PDVODbitak","Analitika Vise objekata","Oporezivo PDV","Set transakcija"]
    belongs_to :user,class_name:"User",primary_key: :id,foreign_key: :user_id,optional: true
end