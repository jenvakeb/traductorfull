
/* --------------------------Codigo de Usuario----------------------- */
package ejemplocup;

import java_cup.runtime.*;
import java.io.Reader;
      
%% //inicio de opciones
   
/* ------ Seccion de opciones y declaraciones de JFlex -------------- */  
   
/* 
    Cambiamos el nombre de la clase del analizador a Lexer
*/
%class AnalizadorLexico

/*
    Activar el contador de lineas, variable yyline
    Activar el contador de columna, variable yycolumn
*/
%line
%column
    
/* 
   Activamos la compatibilidad con Java CUP para analizadores
   sintacticos(parser)
*/
%cup
   
/*
    Declaraciones

    El codigo entre %{  y %} sera copiado integramente en el 
    analizador generado.
*/
%{
    /*  Generamos un java_cup.Symbol para guardar el tipo de token 
        encontrado */
    private Symbol symbol(int type) {
        return new Symbol(type, yyline, yycolumn);
    }
    
    /* Generamos un Symbol para el tipo de token encontrado 
       junto con su valor */
    private Symbol symbol(int type, Object value) {
        return new Symbol(type, yyline, yycolumn, value);
    }
%}
   

/*
    Macro declaraciones
  
    Declaramos expresiones regulares que despues usaremos en las
    reglas lexicas.
*/
   
/*  Un salto de linea es un \n, \r o \r\n dependiendo del SO   */
Salto = \r|\n|\r\n
   
/* Espacio es un espacio en blanco, tabulador \t, salto de linea 
    o avance de pagina \f, normalmente son ignorados */
Espacio     = {Salto} | [ \t\f]
   
/* Una literal entera es un numero 0 oSystem.out.println("\n*** Generado " + archNombre + "***\n"); un digito del 1 al 9 
    seguido de 0 o mas digitos del 0 al 9 */
Entero = 0 | [1-9][0-9]*

Art_Indefi = "A"|"AN"

Art_Defi = "THE"

Sus_Abstracto = "ACCIDENT"|"ANSWER"|
"CHAPTER"|"CLASS"|"DREAM"|"IDEA"|"ISSUE"|"LIST"|
"MISTAKE"|"PROBLEM"|"SCHEME"|"SMILE"|"THOUGHT"|"YEAR"

Sus_Comunes="ADULT"|"ANIMAL"|"ARTICLE"|"BABY"|"BAG"|"BANK"|
"BEACH"|"BELL"|"BIRD"|"BOAT"|"BOX"|"BRIDGE"|"BUSH"|
"CAMP"|"CAPTAIN"|"CARD"|"CASTLE"|"CHAIR"|"CITY"|"COAT"|
"COLLEGE"|"CORNER"|"COUNTRY"|"CUP"|"DAUGHTER"|"DAY"|"DRESS"|
"EAR"|"EDGE"|"EFFECT"|"EGG"|"ELECTION"|"ENGINE"|"FACE"|"FACTORY"|
"FARM"|"FIELD"|"FINGER"|"GARDEN"|"GATE"|"GIRL"|"GROUP"|"GUN"|"HAND"|
"HAT"|"HEART"|"HILL"|"HORSE"|"ISLAND"|"JOB"|"KEY"|"LADY"|"LAKE"|
"LIBRARY"|"MACHINE"|"MAGAZINE"|"MODEL"|"NATION"|"NECK"|"OFFICE"|"PAGE"|
"PATH"|"PLANE"|"RING"|"ROAD"|"SHIP"|"STOP"|"STATION"|"STREAM"|"STREET"|
"STUDENT"|"TABLE"|"TASK"|"TENT"|"TOUR"|"TOWN"|"VALLEY"|"VILLAGE"|"WALK"|"WALL"

Adj_Posesivos="MY"|"MINE"|"YOURS"|"YOUR"|"OUR"|"I"

Adj_Demos="THIS"|"THAT"|"THESE"|"THOSE"

Adj_calif="YOUNG"|"FAMOUS"|"OLD"|"NEW"|"FAT"|"ORANGE"|
"SOFT"|"BLUE"

Adj_cardinales="ONE"|"TWO"|"THREE"|"FOUR"|"FIVE"|"SIX"|
"SEVEN"|"EIGHT"|"NINE"|"TEN"|"ELEVEN"|"TWELVE"|"THIRTEEN"|
"FOURTEEN"|"FIFTEEN"|"SIXTEEN"|"SEVENTEEN"|"EIGHTEEN"|"NINETEEN"|
"TWENTY"|"TWENTY ONE"|"TWENTY TWO"|"TWENTY THREE"|"TWENTY FOUR"|
"TWENTY FIVE"|"TWENTY SIX"|"TWENTY SEVEN"|"TWENTY EIGHT"|"TWENTY NINE"|
"THIRTY"|"THIRTY ONE"|"THIRTY TWO"|"THIRTY THREE"|"THIRTY FOUR"|"THIRTY FIVE"|
"THIRTY SIX"|"THIRTY SEVEN"|"THIRTY EIGHT"|"THIRTY NINE"|"FORTY"|"FORTY ONE"|
"FORTY TWO"|"FORTY THREE"|"FORTY FOUR"|"FORTY FIVE"|"FORTY SIX"|"FORTY SEVEN"|
"FORTY EIGHT"|"FORTY NINE"|"FIFTY"|"FIFTY ONE"|"FIFTY TWO"|"FIFTY THREE"|"FIFTY FOUR"|
"FIFTY FIVE"|"FIFTY SIX"|"FIFTY SEVEN"|"FIFTY EIGHT"|"FIFTY NINE"|"SIXTY"|"SIXTY ONE"|
"SIXTY TWO"|"SIXTY THREE"|"SIXTY FOUR"|"SIXTY FIVE"|"SIXTY SIX"|"SIXTY SEVEN"|"SIXTY EIGHT"|
"SIXTY NINE"|"SEVENTY"|"SEVENTY ONE"|"SEVENTY TWO"|"SEVENTY THREE"|"SEVENTY FOUR"|"SEVENTY FIVE"|
"SEVENTY SIX"|"SEVENTY SEVEN"|"SEVENTY EIGHT"|"SEVENTY NINE"|"EIGHTY"|"EIGHTY ONE"|"EIGHTY TWO"|
"EIGHTY THREE"|"EIGHTY FOUR"|"EIGHTY FIVE"|"EIGHTY SIX"|"EIGHTY SEVEN"|"EIGHTY EIGHT"|"EIGHTY NINE"|
"NINETY"|"NINETY ONE"|"NINETY TWO"|"NINETY THREE"|"NINETY FOUR"|"NINETY FIVE"|"NINETY SIX"|"NINETY SEVEN"|
"NINETY EIGHT"|"NINETY NINE"|"ONE HUNDRED"

Adj_NumOrdinales="FIRST"|"SECOND"|"THIRD"|"FOURTH"|"FIFTH"|"SIXTH"|
"SEVENTH"|"EIGHTH"|"NINTH"|"TENTH"|"ELENTH"|"TWELFTH"|
"THIRTEENTH"|"FOURTEENTH"|"FIFTEENTH"|"SIXTEENTH"|"SEVENTEENTH"|"EIGHTEENTH"|
"NINETEENTH"|"TWENTIETH"

Adj_personal="I"|"YOU"|"HE"|"SHE"|"IT"|"WE"|"THEY"|"ME"|"HIM"|"HER"|"US"|"THEM"


Adj_ProPosesive="MY"|"YOUR"|"HIS"|"HER"|"ITS"|"OUR"|"YOUR"|"THEIR"|
"MINE"|"YOURS"|"HERS"|"THEIRS"

Adj_ProRefexible="MYSELF"|"YOURSELF"|"HIMSELF"|"ITSELF"|"OURSELVES"|"YOURSELVES"|"THEMSELVES"

Adj_ProInterroga="WHAT"|"WHERE"|"WHEN"|"WHO"|"WHOM"|"WHOSE"|"WHICH"|"HOW"|"WHY"

Prep_Modo="WITH"|"WITHOUT"|"FROM"|"OF"|"BY"|"FOR"|"IN"|
"ABOUT"|"ON"
Prep_Lugar="ON"|"UPON"|"AT"|"IN"|"INSIDE"|"OUTSIDE"|"OBOVE"|"BELOW"|
"OVER"|"UNDER"|"BENEATH"|"BY"|"NEAR"|"ACROSS"|"NEX TO"|"BETWEEN"

Prep_Movimiento="UP"|"DOWN"|"OFF"|"TO"|"FROM"|"TOWARDS"|"AWAY FROM"|"THROUGH"|"AROUND"|"FOR"

Prep_Tiempo="BEFORE"|"AFTER"|"DURING"

Sig_Puntuacion=","|"."|";"|":"|"..."|"!"|"("|")"|"["|"]"|"{"|"}"|"----"|"-"|
"/"|"*"
Verbo_Presente="ARISE"|"AWAKE"|"BE"|"BEAR"|"BEAT"|"BECOME"|"BEGIN"|"BEND"|"BET"|
"BIND"|"BITE"|"BLEED"|"BLOW"|"BREAK"|"BREED|"BRING"|"BUILD|"BURN"|"BURST"|"BUY"|"CAST"|"CATCH"|"FREEZE"|"GET"|"GIVE"
|"GO"|"GROW"|"GRIND"|"HANG"|"HEAR"|"HIDE"|"HIT"|"HOLD"|"EAT"|
"HOT"|"HURT"|"KEEP"|"KNOW"|"KNEEL"|"LEAD"|"LEAN"|"LEAP"|"LEARN"|"LEAVE"|"LEND"|"LET"|"LIGHT"|"LOSE"
|"MAKE"|"MEAN"|"MEET"|"OVERCOME"|"PAY"|"READ"|"RIDE"|"RUN"|"SAY"|
"PAY"|"READ"|"RIDE"|"RUN"|"SAY"|"SEE"|"SEEK"|"SELL"|"SEND"|"SET"|"SEW"|"SHAKE"|"SHEAR"|
"SHINE"|"SHOOT"|"SHOW"|"SHRINK"|"SHUT"|"SING"|"SINK"|"SIT"|"SLEEP"|"SLIDE"|"SMELL"|
"SOW"|"SPEAK"|"SPEED"|"SPELL"|"SPEND"|"SPILL"|"SPIN"|"SPIT"|"SPLIT"|"SPOIL"|"SPREAD"|
"SPRING"|"STAND"|"STEAL"|"STICK"|"STINK"|"STRIDE"|"STRIKE"|"SWEAR"

Verbo_PresenteS="ARISES"|"AWAKES"|"BE"|"BEARS"|"BEATS"|"BECOMES"|"BEGINS"|"BENDS"|"BETS"|
"BINDS"|"BITES"|"BLEEDS"|"BLOWS"|"BREAKS"|"BREEDS"|"BRINGS"|"BUILDS"|"BURNS"|"BURSTS"|"BUYS"|"CASTS"|"CATCHES"|"FREEZES"|"GETS"|"GIVES"
|"GOES"|"GROWS"|"GRINDS"|"HANGS"|"HEARS"|"HIDES"|"HITS"|"HOLDS"|"EATS"
"HOTS"|"HURTS"|"KEEPS"|"KNOWS"|"KNEELS"|"LEADS"|"LEANS"|"LEAPS"|"LEARNS"|"LEAVES"|"LENDS"|"LETS"|"LIGHTS"|"LOSES"
|"MAKES"|"MEANS"|"MEETS"|"OVERCOMES"|"PAYS"|"READS"|"RIDES"|"RUNS"|"SAYS"|
"PAYS"|"READS"|"RIDES"|"RUNS"|"SAYS"|"SEES"|"SEEKS"|"SELLS"|"SENDS"|"SETS"|"SEWS"|"SHAKES"|"SHEARS"|
"SHINES"|"SHOOTS"|"SHOWS"|"SHRINKS"|"SHUTS"|"SINGs"|"SINKs"|"SITs"|"SLEEPs"|"SLIDEs"|"SMELLs"|
"SOWs"|"SPEAKs"|"SPEEDs"|"SPELLs"|"SPENDs"|"SPILLs"|"SPINs"|"SPITs"|"SPLITS"|"SPOILS"|"SPREADS"|
"SPRINGS"|"STANDS"|"STEALS"|"STICKS"|"STINKS"|"STRIDES"|"STRIKES"|"SWEARS"

Verbo_PasadoSimple="AROSE"|"AWOKE"|"BORE"|"BEAT"|"BECOME"|"BEGAN"|
"BENT"|"BET"|"BOUND"|"BID"|"BIT"|"BLED"|"BLEW"|"BROKE"|
"BRED"|"BROUGHT"|"BROADCAST"|"BUILT"|"BURST"|"BOUGHT"|"CAST"|"CAUGHT"|
"CAME"|"COST"|"CUT"|"CHOSE"|"CLUNG"|"CREPT"|"DEALT"|"DUG"|
"DREW"|"DREAMT"|"DRANK"|"DROVE"|"ATE"|"FELL"|"FED"|
"FELT"|"FOUGHT"|"FOUND"|"FLED"|"FLEW"|"FORBADE"|"FORGOT"|"FORGAVE"|
"FROZE"|"WENT"|"GREW"|"GROUND"|"HUNG"|"HEARD"|"HID"|
"HELD"|"HURT"|"KEPT"|"KNELT"|"LAID"|"LED"|"LEAPT"|"LEARNT"|
"LET"|"LAY"|"LIT"|"LOST"|"MADE"|"MEANT"|"MET"|"MISTOOK"|
"OVERCAME"|"PAID"|"PUT"|"READ"|"RODE"|"RANG"|"ROSE"|"RAN"|
"SAID"|"SAW"|"SOUGHT"|"SOLD"|"SENT"|"SEWED"|"SHOOK"|"SHORE"|
"SHONE"|"SHOT"|"SHOWED"|"SHRANK"|"SHUT"|"SANG"|"SANK"|"SAT"|
"SLEPT"

Verbo_PasadoParticiP="ARISEN"|"AWOKEN"|"BEEN"|"BORNE"|"BEATEN"|
"BECOME"|"BEATEN"|"BECOME"|"BEGUN"|"BENT"|"BET"|"EATEN"|
"BOUND"|"BID"|"BITTEN"|"BLED"|"BLOWN"|"BROKEN"|"BRED"|"BROUGHT"|"BROADCAST"|"BUILT"|"BURNT"|
"CAST"|"CAUGHT"|"COME"|"COST"|"CUT"|"CHOSEN"|"CLUNG"|"CREPT"|"DEALT"|"DYG"|"DONE"|
"DRAWN"|"DREAMT"|"DRUNK"|"DRIVEN"|"EATEN"|"FALLEN"|"FED"|"FELT"|"FLOWN"|"FORBIDDEN"|"FORGIVE"|
"FORGOTTEN"|"FROZE"|"GONE"|"GROWN"|"GROUND"|"HUNG"|"HEARD"|"HIDDEN"|"HELD"|"HURT"|
"KEPT"|"KNOWN"|"KNELT"|"LAID"|"LED"|"LEAPT"|"LEARNED"|"LET"|"LAIN"|"LIT"|"LOST"|
"MADE"|"MET"|"PAID"|"RIDDEN"|"RUNG"|"SAID"|"SEEN"|"SOUGHT"|"SOLD"|"SEWN"|"SHAKEN"|
"SHUT"|"SUNG"|"SUNK"|"SPOKEN"|"SPOILED"|"SPRUNG"|"STOOD"|"STOLEN"|"STRUCK"|"STUNG"

Conj_Cooradver="BUT"|"HOWEVER"|"EVEN SO"|"INSTEAD"|"ON THE CONTRARY"

Conj_CoorCupula="AND"|"NOT ONLY".*."BUT ALSO"|"BUT ONLY".*."BUT".*."AS WELL"|
"BOTH".*."AND"|"NO SOONER" .*. "THAN"

Conj_Coordisyun="OR"|"EITHER".*."OR"|"NEITHER".*."NOR"|"WETHER".*."OR"|"OR ELSE"|"OTHERWISE"

Con_Subordisyun="WHETHER"|"UNLESS"|"PROVIDED"|"PROVIDING"|"AS LONG AS"|"IN CASE"

Conj_Suborcasual="BECAUSE"|"BECAUSE OF"|"SINCE"|"AS"|"DUE TO"|"OWING OF"

Conj_Conjsuboconsecu="THEN"|"MOREOVER"|"FUTHERMORE"|"BESIDES"|"IN ADDITION TO"

Con_Consuboconcesi="ALTHOUGH"|"EVEN"|"NOT EVEN IF"|"DESPITE"|"IN SPITE OF"|"REGARDLESS OF"

Conj_Conjsubocomparat="AS".*."AS"|"NOT AS".*."AS"|"AS IF"|"AS THOUGH"|"THAN"

Aux_Present = "AM"|"IS"|"ARE"

Aux_Past = "WAS"|"WERE"

Weather = "DRY"|"FLOOD"|"FOG"|"FREEZE"|"HOT"|"RAINY"|"SNOWY"

Profesiones= "ACCOUNTANT"|"ACTOR"|"ACTRESS"|"AIR HOSTESS"|"ARCHAEOLOGIST"|"ARCHITECT"|"ASTRONAUT"|"BAKER"|"BIOLOGIST"|
"BRICKLAYER"|"BUS DRIVER"|"BUSINESSMAN"|"BUSINESSWOMAN"|"BUTCHER"|"CARATAKER"|"CARPENTER"|"CASHIER"|"CLEANER"|"CLOWN"|"COBBLER"|
"COBBLER"|"CONSULTANT"|"COOK"|"COUNSELOR"|"CHEF"|"CHEMIST"|"DANCER"|"DECORATOR"|"DENTIST"|"DESINGER"|"DOCTOR"|"DRESSMAKER"|"ECONOMIST"|"ELECTRICIAN"|"ENGINNER"|"FARMER"|
"FIREMAN"|"FISHERMAN"|"FLORIST"|"FRUITERER"|"GARBAGE COLLECTOR"|"GARDENER"|"HAIRDRESSER"|"HOUSEWIFE"|"HUNTER"|"JEWELLER"|"JOURNALIST"|
"JUDGE"|"LAWYER"|"LIBRARIAN"|"LIFE GUARD"|"LORRY DRIVER"|"MAILMAN"|"MECHANIC"|
"METEOROLOGIST"|"MINER"|"MODEL"|"MONK"|"NANNY"|"NUN"|"NURSEMAID"|"OFFICE WORKER"|"PAINTER"|"PASTRY COOK"|"PHARMACIST"|
"PHOTOGRAPHER"|"PHYSICIST"|"PLUMBER"|"POLICEMAN"|"POLICEWOMAN"|"POLITICIAN"|"PORTER"

Vegetales="GARLIC"|"ARTICHOKE"|"CELERY"|"AUBERGINE"|"CRESS"|"BROCCOLI"|"MARROW"|"PUMPKIN"|"ONION"|"CHIVE"|"CAULIFLOWER"|
"ASPARAGUS"|"SPINACH"|"PEA"|"LETTUCE"|"PATATO"|"CUCUMBER"|"PASLEY"|"PEPPER"|"SWEET"|"BEET"|"MUSHROOM"
"TOMATO"|"CARROT"

Paises="BELICE"|"COSTA RICA"|"EL SALVADOR"|"GUATEMALA"|"HONDURAS"|"NICARAGUA"|"PANAMA"|"ARGENTINA"|"BOLIVIA"|"BRASIL"|"CHILE"|"COLOMBIA"|"ECUADOR"|
"GUYANA"|"PARAGUAY"|"PERU"|"SURINAM"|"URUGUAY"|"VENEZUELA"|"USA"|"CANADA"

Animales="MAMMALS"|"BIRDS"|"REPTILES"|"AMPHIBIANS"|"FISH"|"INSECTS"|"CRUSTACEANS"|"BULL"|"COW"|"CHICKEN"|"HEN"|
"ROOSTER"|"COCK"|"CHICK"|"DONKEY"|"GOAT"|"HORSE"|"PIG"|"RABBIT"|"SHEEP"|"TURKEY"|"GOOSE"|"LLAMA"|
"OX"|"PRAWN"|"SHRIMP"|"CRAB"|"DOLPHIN"|"SHARK"|"EEL"|"WHALE"|"KILLER"|"JELLYFISH"|"LOBSTER"|"MANTA RAY"|"OCTOPUS"|
"OYSTER"|"ALMEJA"|"SEAL"|"SEA TURTLE"|"SEA LION"|"LION"|"SQUID"|"CUTTLEFISH"|"SEAHORSE"|"STARFISH"|"HAKE"|"SARDINE"|
"TUNAFISH"|"SALMON"|"BOAR"|"DEER"|"MOUSE"|"RACOON"|"SKUNK"|"SQUIRREL"|"BEAVER"|"OTTER"|"ARMADILLO"|"BAT"|
"BEAR"|"FALCON"|"EAGLE"|"VULTURE"|"HUMMINGBIRD"|"SPARROW"|"CROW"|"OWL"|"DOVE"|
"PIGEON"|"FLY"|"BUTTERFLY"|"DRAGONFLY"|"GRASSHOPPER"|"LADYBUG"|"MOSQUTO"|"MOTH"|"PRAYING"|"SNAIL"|"SPIDER"|"WASP"|"ANT"|"BEE"|"BEETLE"|"WORM"|"COCKROACH"|"APE"|"MONKEY"|"BABOON"|"COBRA"|
"CHIMPANZEE"|"GORILLA"|"PANDA BEAR"|"SLOTH"|"PARROT"|"TIGER"|"BOA CONSTRICTOR"|"PYTHON"|"TRO[ICAL FISH"|"GOLDFISH"|"HAMSTER"|"GUINEA PIG"|
"CANARY"|"CAT"|"DOG"|"WATER BUFFALO"|"CHEETAH"|"LEOPARD"|"ELEPHANT"|"GIRAFFE"|"HYENA"|"KANGAROO"|"KOALA"|"OSTRICH"|"RHINCOEROS"|"ZEBRA"|"ANTELOPE"|"FLAMINGO"|"FROG"|"TOAD"|"HIPPOPOTAMUS"|"CROCODILE"|"ALLIGATOR"|"DUCK"|"TURTLE"|
"CAMEL"|"DROMEDARY"|"PENGUIN"|"POLAR BEAR"|"WALRUS"|"RATTLESNAKE"|"SCORPION"|"TORTOISE"|"SNAKE"|"LIZARD"|"IGUANA"|"CHAMELEON"

Aux_Presp = "DO" | "DOES"
Aux_Pasp = "DID"
Aux_Pps = "HAS" | "HAVE"
Aux_P = "HAD" 

%% //fin de opciones
/* -------------------- Seccion de reglas lexicas ------------------ */
   
/*
   Esta seccion contiene expresiones regulares y acciones. 
   Las acciones son código en Java que se ejecutara cuando se
   encuentre una entrada valida para la expresion regular correspondiente */
   
   /* YYINITIAL es el estado inicial del analizador lexico al escanear.
      Las expresiones regulares solo serán comparadas si se encuentra
      en ese estado inicial. Es decir, cada vez que se encuentra una 
      coincidencia el scanner vuelve al estado inicial. Por lo cual se ignoran
      estados intermedios.*/
   
<YYINITIAL> {
   
    {Art_Indefi} {System.out.println("ART_INDEFI"); return symbol(sym.ART_INDEFI); }
    {Art_Defi} {System.out.println("ART_DEFI"); return symbol(sym.ART_DEFI);}
    {Sus_Abstracto} {System.out.println("SUS_ABSTRACT"); return symbol(sym.SUS_ABSTRACT);}
    {Sus_Comunes} {System.out.println("SUS_COMUN"); return symbol(sym.SUS_COMUN);}
    {Adj_Posesivos} {System.out.println("ADJ_POSESIV"); return symbol(sym.ADJ_POSESIV);}
    {Adj_Demos} {System.out.println("ADJ_DEMOS"); return symbol(sym.ADJ_DEMOS);}
    {Adj_calif} {System.out.println("ADJ_CALIFI"); return symbol(sym.ADJ_CALIFI);}
    {Adj_cardinales} {System.out.println("ADJ_NUMCARDIN"); return symbol(sym.ADJ_NUMCARDIN);}
    {Adj_NumOrdinales} {System.out.println("ADJ_NUMORD"); return symbol(sym.ADJ_NUMORD);}
    {Adj_personal} {System.out.println("ADJ_PROPERSO"); return symbol(sym.ADJ_PROPERSO);}
    {Adj_ProPosesive} {System.out.println("ADJ_PROPOSESIV"); return symbol(sym.ADJ_PROPOSESIV);}
    {Adj_ProRefexible} {System.out.println("ADJ_PROREFLEX"); return symbol(sym.ADJ_PROREFLEX);}
    {Adj_ProInterroga} {System.out.println("ADJ_PROINTERR"); return symbol(sym.ADJ_PROINTERR);}
    {Prep_Modo} {System.out.println("PREP_MOD"); return symbol(sym.PREP_MOD);}
    {Prep_Lugar} {System.out.println("PREP_LUG"); return symbol(sym.PREP_LUG);}
    {Prep_Movimiento} {System.out.println("PREP_MOV"); return symbol(sym.PREP_MOV);}
    {Prep_Tiempo} {System.out.println("PREP_TIEM"); return symbol(sym.PREP_TIEM);}
    {Sig_Puntuacion} {System.out.println("SIG_PUNT"); return symbol(sym.SIG_PUNT);}
    {Verbo_Presente} {System.out.println("VERBO_PRESENT"); return symbol(sym.VERBO_PRESENT);}
    {Verbo_PasadoSimple} {System.out.println("VERBO_PASADOSIMP"); return symbol(sym.VERBO_PASADOSIMP);}
    {Verbo_PresenteS} {System.out.println("VERBO_PRESENTS"); return symbol(sym.VERBO_PRESENTS);}
    {Verbo_PasadoParticiP} {System.out.println("VERBO_PASADOPARTICI"); return symbol(sym.VERBO_PASADOPARTICI);}
    {Conj_Cooradver} {System.out.println("CONJ_COORADVERV"); return symbol(sym.CONJ_COORADVERV);}
    {Conj_CoorCupula} {System.out.println("CONJ_COORCOPU"); return symbol(sym.CONJ_COORCOPU);}
    {Conj_Coordisyun} {System.out.println("CONJ_COORDISYU"); return symbol(sym.CONJ_COORDISYU);}    
    {Con_Subordisyun} {System.out.println("CONJ_SUBORDISYU"); return symbol(sym.CONJ_SUBORDISYU);}  
    {Conj_Suborcasual} {System.out.println("CONJ_SUBORCAUS"); return symbol(sym.CONJ_SUBORCAUS);}
    {Conj_Conjsuboconsecu} {System.out.println("CONJ_CONJSUBOCONSEC"); return symbol(sym.CONJ_CONJSUBOCONSEC);}
    {Con_Consuboconcesi} {System.out.println("CONJ_CONJSUBOCONCES"); return symbol(sym.CONJ_CONJSUBOCONCES);}
    {Conj_Conjsubocomparat} {System.out.println("CONJ_CONJSUBOCOMPARA"); return symbol(sym.CONJ_CONJSUBOCOMPARA);}
    {Aux_Present} {System.out.println("AUX_PRESEN"); return symbol(sym.AUX_PRESEN);}
    {Aux_Past} {System.out.println("AUX_PAS"); return symbol(sym.AUX_PAS);}
    {Weather} {System.out.println("WEATH"); return symbol(sym.WEATH);}
    {Profesiones} {System.out.println("PROF"); return symbol(sym.PROF);}
    {Vegetales} {System.out.println("VEGET"); return symbol(sym.VEGET);}
    {Paises} {System.out.println("PAIS"); return symbol(sym.PAIS);}
    {Animales} {System.out.println("ANIMALS"); return symbol(sym.ANIMALS);}
    {Aux_Presp} {System.out.println("AUXPRESP"); return symbol(sym.AUXPRESP);}
    {Aux_Pasp} {System.out.println("AUXPASP"); return symbol(sym.AUXPASP);}
    "?" {System.out.println("INTERRO"); return symbol(sym.INTERRO);}
    "NOT" {System.out.println("NO"); return symbol(sym.NO);}
    "WILL" {System.out.println("WILL"); return symbol(sym.WILL);}
    "GOING TO" {System.out.println("GOING"); return symbol(sym.GOING);}
    {Aux_Pps} {System.out.println("AUXPPS"); return symbol(sym.AUXPPS);}
    {Aux_P} {System.out.println("AUXPASPP"); return symbol(sym.AUXPASPP);}

/* Regresa que el token SEMI declarado en la clase sym fue encontrado. */
    ";"                { return symbol(sym.SEMI); }
    /* Regresa que el token OP_SUMA declarado en la clase sym fue encontrado. */
    "+"                {  System.out.print(" + ");
                          return symbol(sym.OP_SUMA); }
    /* Regresa que el token OP_SUMA declarado en la clase sym fue encontrado. */
    "-"                {  System.out.print(" - ");
                          return symbol(sym.OP_RESTA); }
    /* Regresa que el token OP_SUMA declarado en la clase sym fue encontrado. */
    "*"                {  System.out.print(" * ");
                          return symbol(sym.OP_MULT); }
    /* Regresa que el token PARENIZQ declarado en la clase sym fue encontrado. */
    "("                {  System.out.print(" ( ");
                          return symbol(sym.PARENIZQ); }
                          /* Regresa que el token PARENIZQ declarado en la clase sym fue encontrado. */
    ")"                {  System.out.print(" ) ");
                          return symbol(sym.PARENDER); }
   
    /* Si se encuentra un entero, se imprime, se regresa un token numero
        que representa un entero y el valor que se obtuvo de la cadena yytext
        al convertirla a entero. yytext es el token encontrado. */
    {Entero}      {   System.out.print(yytext()); 
                      return symbol(sym.ENTERO, new Integer(yytext())); }

    /* No hace nada si encuentra el espacio en blanco */
    {Espacio}       { /* ignora el espacio */ } 
}


/* Si el token contenido en la entrada no coincide con ninguna regla
    entonces se marca un token ilegal */
[^]                    { System.out.println("Token ilegal <"+yytext()+">"); }
