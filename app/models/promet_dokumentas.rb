class PrometDokumentas < ApplicationRecord
    NAZIVI_KOLONA=["PrometDokumentaID","NalogGK","Dokument","IzdavalacImenilac","BrojOznakaPeriod",
    "DatumPrometa","Iznos(Bruto)","Korekcija"]
    belongs_to :user,class_name:"User",primary_key: :id,foreign_key: :user_id,optional: true

end