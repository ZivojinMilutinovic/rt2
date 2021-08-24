
function prikaziElemente(...elements){
   
    for(i=0;i<elements.length;i++){
        elements[i].classList.remove("display-none");
    }
}
function sakrijElemente(...elements){
    
    for(i=0;i<elements.length;i++){
        elements[i].classList.add("display-none");
    }
}


$(document).on(" ready page:load turbolinks:load",()=>{
    let hot_keys=document.getElementById("hot_keys");
    console.log(hot_keys)
    if(hot_keys!=null){
        
        const novaForma=document.getElementsByClassName("new")[0];
        const tabela=document.getElementsByClassName("tabela-prikaz")[0];
        const configStranica=document.getElementsByClassName("config-stranica")[0];
        const input_search=document.getElementById("search");
        const table=$('#my-table').DataTable();1
        document.onkeypress=(e)=>{
            if(e.target.tagName.toUpperCase()=='INPUT') return;
            if(hot_keys!=null) {
           
            if(e.key=="1"){
                //prikazi novu formu za pravljenje objekta na stranici
                
                prikaziElemente(novaForma);
                sakrijElemente(tabela,configStranica);
                
            } else if (e.key=="2"){
                //prikazi tabelu za pravljenje na stranici
            sakrijElemente(novaForma,configStranica);
            prikaziElemente(tabela);
           
            
            }else if (e.key=="3"){
                //prikazuje config za dati objekat
                prikaziElemente(configStranica);
                sakrijElemente(novaForma,tabela);

            }
            }
        }
    }
})
