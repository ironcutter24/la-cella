Avvolto da una calda oscurità, noti che il tepore inizia a svanire, quando odi in lontananza una voce infantile:
"Svegliati. Il fuoco si sta estinguendo, e noi con lui."

 * [Alzati] -> cell_context
 * [Continua a dormire]
 "Non puoi ignorare per sempre il tuo dolore. E' ora. SVEGLIATI!"
Ti alzi di soprassalto, col cuore che batte all'impazzata. <>
-> cell_context


=== cell_context ===
{Scopri che dietro le tue palpebre, ormai aperte, si celava|Ti trovi in} una stanza angusta e spoglia, con fredde pareti di pietra ed una lurida coperta accartocciata sul pavimento. Noti la pesante porta di legno e le sbarre sull'unica finestrella{, e d'improvviso tutto diventa un po' più freddo|}: ti trovi in una cella. {Una ben poco confortevole, per quanto conforto possa dare una residenza imposta.|}

~ currentContext = -> cell_context
+ {has_inventory()} [--- Apri inventario ---] -> player_inventory

+ [Guarda fuori dalla finestrella] La finestrella è troppo in alto, e non c'è nulla nella stanza su cui poter salire. La luce della luna filtra fra le sbarre come una nostalgica sfida.
    -> cell_context
    
+ [Osserva la porta]
    -> cell_door

+ [Osserva la coperta]
    -> cell_blanket


=== cell_door ===
La porta è di legno massiccio. Una piccola apertura all'altezza del viso incornicia un corridoio tenuemente illuminato da fiaccole distanti.

* {hasIronFile} [Lima le cerniere] Appoggi la lima sulle grandi cerniere in ferro battuto e inizi a sfregare, all'inizio a fatica, man mano più rapidamente, poi di nuovo a fatica. Ci vorrà molto tempo, ma non hai certo di meglio da fare. Dopo alcune ore la prima cerniera cede e la porta si muove leggermente. A metà della seconda il peso finisce il lavoro e la porta crolla a terra di fronte a te.
    -> cell_exit
* [Batti sulla porta] Ti avvicini alla porta e batti violentemente i pugni su di essa. Non si muove di un millimetro.
    -> cell_door
* [Grida] "Aiuto, c'è qualcuno?! Perchè sono qui, riuscite a sentirmi?!" L'unica risposta è l'eco delle tue grida nel corridoio.
    -> cell_door
+ [Indietro] -> cell_context


=== cell_blanket ===
Il tessuto gualcito della copera è ricoperto di chiazza verdastre delle quali è preferibile non indagare la provenienza.
+ [Annusa] {Avvicini il naso al fetido cencio ed immediatamente ti penti della tua audacia, con un forte bruciore che corre lungo le tue narici e le lacrime che ti riempiono gli occhi.|Fortunatamente non sei così stupido da annusarla una seconda volta.}
    -> cell_blanket
* [Sposta] Sotto alla coperta trovi una bambola di pezza.
    ~ get_object()
    ~ hasBabyDoll = 1
    -> cell_blanket
+ [Indietro] -> cell_context
    

=== cell_exit ===
Uscito dalla cella, in piedi sulla porta scardinata, ti guardi attorno in un corridoio apparentemente senza fine.
TO BE CONTINUED...
-> END


/*****************************/
/*** Inventory and objects ***/
/*****************************/

VAR currentContext = ()
VAR inventoryType = 0

VAR hasBabyDoll = 0
VAR hasIronFile = 0


=== function has_inventory() ===
    ~ return hasBabyDoll or hasIronFile
    
=== function get_object() ===
    <> (Oggetto aggiunto all'inventario)


=== player_inventory ===
{ inventoryType:
- 0: Osservi gli oggetti in tuo possesso...
- 1: Apri la tua sacca e ne osservi il contenuto...
- 2: Osservi il contenuto del tuo zaino...
}
+ {hasBabyDoll == 1} [Bambola di pezza] -> cell_baby_doll
+ {hasBabyDoll == 2} [Resti della bambola] -> cell_baby_doll
+ {hasIronFile} [Lima di ferro] -> cell_iron_file
+ [--- Chiudi inventario ---] -> currentContext


=== cell_baby_doll ===
Oggetto: <>
{ hasBabyDoll:
- 1: Una piccola bambola di pezza, il tessuto è bucherellato dai tarli. Stringendola, ti accorgi che c'è qualcosa di duro che forma la testa e scende assottigliandosi lungo il resto del corpo.
- 2: Quel che rimane della bambola ormai logorata.
}

* [Strappa] Afferri la testa della bambola in una mano ed il corpo nell'altra. Tiri con forza finchè il tessuto non cede, rivelando una lima di ferro.
    ~ get_object()
    ~ hasIronFile = 1
    ~ hasBabyDoll = 2
    -> cell_baby_doll
+ [Torna all'inventario] -> player_inventory


=== cell_iron_file ===
Oggetto: <>
Solo una vecchia lima arrugginita, eppure per te emana un'aura di speranza.
+ [Torna all'inventario] -> player_inventory
    
