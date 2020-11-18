#Seed podaci za partnere
# excel_file=Roo::Spreadsheet.open('C:/Users/Zika/Documents/Partneri.xlsx')
# sheet=excel_file.sheet(0)
# sheet.each(id: "PartneriID",naziv:"Naziv",opsti_podaci:"Opšti podaci ***",sifra:"Sifra",tip:"Tip",sediste:"Sediste",adresa:"Adresa",kontakt:"Kontakt ***",status:"Status",pib:"PIB",tekuci:"Tekuci ***",pdv:"PDV") do |hash|
#     next if hash[:naziv]=="Naziv"
#     k=Partneri.new(naziv:hash[:naziv],opsti_podaci:hash[:opsti_podaci],sifra:hash[:sifra],tip:hash[:tip],sediste:hash[:sediste],adresa:hash[:adresa],kontakt:hash[:kontakt],status:hash[:status],pib:hash[:pib],tekuci:hash[:tekuci], pdv:hash[:pdv])
#     k.id=hash[:id]
#     k.save
# end

#Seed podaci za Poreske tarife
# excel_file=Roo::Spreadsheet.open('C:/Users/Zika/Documents/Tarife.xlsx')
# sheet=excel_file.sheet(0)
# sheet.each(id: "PorezID",tarifa:"Tarifa",naziv:"Naziv",stopa:"Stopa",poc_dat:"PocDat",zav_dat:"ZavDat") do |hash|
#     next if hash[:naziv]=="Naziv"
#     k=PoreskeTarife.new(naziv:hash[:naziv],stopa:hash[:stopa],tarifa:hash[:tarifa],poc_dat:hash[:poc_dat],zav_dat:hash[:zav_dat])
#     k.id=hash[:id]
#     k.save
# end

#Seed podaci za Robu
# excel_file=Roo::Spreadsheet.open('C:/Users/Zika/Documents/Roba.xlsx')
# sheet=excel_file.sheet(0)
# sheet.each(id: "RobaID",analitika_racuna_id:"AnalitikaRacunaID",naziv:"Naziv",sifra:"Šifra",oznaka:"Oznaka",kat_broj:"KatBroj",jedinica_mere:"JedMere",poreska_tarifa:"Poreska tarifa",pakovanje:"Pakovanje") do |hash|
#     next if hash[:naziv]=="Naziv"
#     k=Robas.new(naziv:hash[:naziv],analitika_racuna_id:hash[:analitika_racuna_id],sifra:hash[:sifra],oznaka:hash[:oznaka],kat_broj:hash[:kat_broj],jedinica_mere:hash[:jedinica_mere],poreska_tarifa:hash[:poreska_tarifa],pakovanje:hash[:pakovanje])
#     k.id=hash[:id]
#     k.save
# end

#Seed podaci za Tip robe
# TipRobe.create(naziv:"Materijal",oznaka:"MAT")
# TipRobe.create(naziv:"Veleprodaja",oznaka:"VEL")
# TipRobe.create(naziv:"Maloprodaja",oznaka:"MAL")
# TipRobe.create(naziv:"Gotovi Proizvod",oznaka:"GOT")
# TipRobe.create(naziv:"OsnovnaSredstva",oznaka:"OSR")
# TipRobe.create(naziv:"Komision",oznaka:"KOM")
# TipRobe.create(naziv:"Alat i Sitan In",oznaka:"ASI")

#Seed podaci za Magacine
# Magacini.create(objekti_id:33,naziv:"MAGACIN 1",zalihe:"Veleprodaja",adresa:"Obeliceva 8",lokacija:"Trstenik",sifra:"6",konto:"13410")
# Magacini.create(objekti_id:33,naziv:"MAGACIN 2",zalihe:"Materijal",adresa:"Obeliceva 18",lokacija:"Trstenik",sifra:"2",konto:"10110")
# Magacini.create(objekti_id:33,naziv:"PRODAVNICA",zalihe:"Maloprodaja",adresa:"SELISTE",lokacija:"Belo brdo",sifra:"3",konto:"13410")

