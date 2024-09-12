


/*
Queremos reflejar entonces que:
megurineLuka sabe cantar la canción nightFever cuya duración es de 4 min y también canta la canción foreverYoung que dura 5 minutos.	
hatsuneMiku sabe cantar la canción tellYourWorld que dura 4 minutos.
gumi sabe cantar foreverYoung que dura 4 min y tellYourWorld que dura 5 min
seeU sabe cantar novemberRain con una duración de 6 min y nightFever con una duración de 5 min.
kaito no sabe cantar ninguna canción.*/

%vocaloid(Nombre).
vocaloid(megurineLuka).
vocaloid(hatsuneMiku).
vocaloid(gumi).
vocaloid(seeU).
vocaloid(kaito).

%canta(Vocaloid,Cancion(Duracion)).
canta(megurineLuka, cancion(nightFever, 4)).
canta(megurineLuka, cancion(foreverYoung, 3)).

canta(hatsuneMiku, cancion(tellYourWorld, 4)).

canta(gumi, cancion(foreverYoung, 4)).
canta(gumi, cancion(tellYourWorld, 5)).

canta(seeU, cancion(novemberRain, 6)).
canta(seeU, cancion(nightFever, 5)).

/*
Para comenzar el concierto, es preferible introducir primero a los can  tantes más novedosos, por lo que 
necesitamos un predicado para saber si un vocaloid es novedoso cuando saben al menos 2 canciones y el tiempo
 total que duran todas las canciones debería ser menor a 15.
*/
esNovedoso(Vocaloid):-
    vocaloid(Vocaloid),
    cancionesQueSabe(Vocaloid,Cantidad),
    tiempoCantando(Vocaloid,TiempoTotal),
    Cantidad >1,
    TiempoTotal < 15.

cancionesQueSabe(Vocaloid,Cantidad):-
    vocaloid(Vocaloid),
    findall(Cancion,canta(Vocaloid,Cancion),ListaDeCanciones),
    length(ListaDeCanciones,Cantidad).

tiempoCantando(Vocaloid,TiempoTotal):-
    vocaloid(Vocaloid),
    findall(Tiempo,canta(Vocaloid,cancion(_,Tiempo)),ListaDeTiempos),
    sum_list(ListaDeTiempos,TiempoTotal).

/*
Hay algunos vocaloids que simplemente no quieren cantar canciones largas porque no les gusta, 
es por eso que se pide saber si un cantante es acelerado, condición que se da cuando todas
 sus canciones duran 4 minutos o menos. Resolver sin usar forall/2.*/

esAcelerado(Vocaloid):-
    canta(Vocaloid,_),
    not((canta(Vocaloid,cancion(_,Tiempo)),Tiempo>4)).
    
/*
Hay tres tipos de conciertos:
gigante del cual se sabe la cantidad mínima de canciones que el cantante tiene que saber y además la duración
 total de todas las canciones tiene que ser mayor a una cantidad dada.
mediano sólo pide que la duración total de las canciones del cantante sea menor a una 	cantidad determinada.
pequeño el único requisito es que alguna de las canciones dure más de una cantidad dada.
*/


concierto(mikuExpo).
concierto(vocalekt).
concierto(magicalMarai).
concierto(mikuFest).

tipoConcierto(mikuExpo,gigante(2,6)).
tipoConcierto(magicalMarai,gigante(3,10)).
tipoConcierto(mikuFest,pequeno(4)).
tipoConcierto(vocalekt,mediano(9)).

pais(vocalekt,usa).
pais(mikuFest,argentina).
pais(magicalMarai,japon).
pais(mikuExpo,usa).

fama(mikuExpo,2000).
fama(magicalMarai,3000).
fama(mikuFest,100).
fama(vocalekt,1000).

/*Se requiere saber si un vocaloid puede participar en un concierto, esto se da cuando 
cumple los requisitos del tipo de concierto. También sabemos que Hatsune Miku puede
 participar en cualquier concierto.*/
puedeParticipar(hatsuneMiku,Concierto):-
    concierto(Concierto).

puedeParticipar(Vocaloid,Concierto):-
    vocaloid(Vocaloid),
    distinct(Vocaloid,canta(Vocaloid,_)),
    Vocaloid\= hatsuneMiku,
    cumpleConLasCondiciones(Vocaloid,Concierto).

cumpleConLasCondiciones(Vocaloid,Concierto):-
    concierto(Concierto),
    tipoConcierto(Concierto,TipoConcierto),
    condicionSegunTipo(Vocaloid,TipoConcierto).

condicionSegunTipo(Vocaloid,pequeno(DuracionMinimaCancion)):-
    canta(Vocaloid,cancion(_,Tiempo)),
    Tiempo > DuracionMinimaCancion.

condicionSegunTipo(Vocaloid,mediano(DuracionMaximaShow)):-
    tiempoCantando(Vocaloid,TiempoTotal),
    TiempoTotal < DuracionMaximaShow.

condicionSegunTipo(Vocaloid,gigante(CantidadDeCancionesMinima,DuracionMinimaShow)):-
    tiempoCantando(Vocaloid,TiempoTotal),
    cancionesQueSabe(Vocaloid,Cantidad),
    Cantidad >= CantidadDeCancionesMinima,
    TiempoTotal > DuracionMinimaShow.
/*Conocer el vocaloid más famoso, es decir con mayor nivel de fama. El nivel de fama de un vocaloid se 
calcula como la fama total que le dan los conciertos en los cuales puede participar multiplicado por
 la cantidad de canciones que sabe cantar.*/
 nivelDeFama(Vocaloid,NivelDeFama):-
    vocaloid(Vocaloid),
    findall(Fama,(puedeParticipar(Vocaloid,Concierto),fama(Concierto,Fama)),ListaDeFama),
    sum_list(ListaDeFama,FamaConseguida),
    cancionesQueSabe(Vocaloid,Cantidad),
    NivelDeFama is Cantidad * FamaConseguida.




/*
Queremos verificar si un vocaloid es el único que participa de un concierto,
 esto se cumple si ninguno de sus conocidos ya sea directo o indirectos (en cualquiera de los niveles) 
 participa en el mismo concierto.
*/
conoce(megurineLuka, hatsuneMiku).
conoce(megurineLuka, gumi).
conoce(gumi, seeU).
conoce(seeU, kaito).

unicoEnConcierto(Vocaloid,Concierto):-
    puedeParticipar(Vocaloid,Concierto),
    not((conocido(Vocaloid,Conocido),puedeParticipar(Conocido,Concierto))).

conocido(Vocaloid,Conocido):-
    conoce(Vocaloid,Conocido).
conocido(Vocaloid,Conocido):-
    conoce(Vocaloid,ConocidoDirecto),
    conoce(ConocidoDirecto,Conocido).