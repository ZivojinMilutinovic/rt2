class Korisnici < ApplicationRecord
    NAZIVI_KOLONA=["KorisnikID","Opšti podaci","Naziv Firme","Oblik Organizovanja","Knjigovodstvo",
        "Šifra","Mesto sedišta","Adresa","Pošta","PIB","ŠifraDelatnosti",
    "MatičniBroj","Početak rada","Kontakt osoba","Prezime i ime","Mesto stanovanja","Funkcija",
    "Ovlašćenje, položaj","Telefon fiksni","Mobilni","Fax","e-mail","TekuciRačun","Broj računa",
    "Tip","Namena","Banka","PDV aktivnost","PočetniDatum","PDV broj","Završni datum PDV",
    "PoreskiPeriod","Org jedinice pogoni","Naziv","Lokacija, mesto","AdresaUlica","Kontakt",]
    belongs_to :user,class_name:"User",primary_key: :id,foreign_key: :user_id,optional: true
end