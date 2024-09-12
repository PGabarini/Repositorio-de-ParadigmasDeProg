esPersonaje(aang).
esPersonaje(katara).
esPersonaje(zoka).
esPersonaje(appa).
esPersonaje(momo).
esPersonaje(toph).
esPersonaje(tayLee).
esPersonaje(zuko).
esPersonaje(azula).

esPersonaje(iroh).

% esElementoBasico/1 nos permite conocer los elementos básicos que pueden controlar algunos personajes

esElementoBasico(fuego).
esElementoBasico(agua).
esElementoBasico(tierra).
esElementoBasico(aire).

% elementoAvanzadoDe/2 relaciona un elemento básico con otro avanzado asociado

elementoAvanzadoDe(fuego, rayo).
elementoAvanzadoDe(agua, sangre).
elementoAvanzadoDe(tierra, metal).

% controla/2 relaciona un personaje con un elemento que controla

controla(zuko, rayo).
controla(toph, metal).
controla(katara, sangre).
controla(aang, aire).
controla(aang, agua).
controla(aang, tierra).
controla(aang, fuego).
controla(azula, rayo).
controla(iroh, agua).
controla(iroh, rayo).

% visito/2 relaciona un personaje con un lugar que visitó. Los lugares son functores que tienen la siguiente forma:
% reinoTierra(nombreDelLugar, estructura)
% nacionDelFuego(nombreDelLugar, soldadosQueLoDefienden)
% tribuAgua(puntoCardinalDondeSeUbica)
% temploAire(puntoCardinalDondeSeUbica)

visito(aang, reinoTierra(baSingSe, [muro, zonaAgraria, sectorBajo, sectorMedio])).
visito(iroh, reinoTierra(baSingSe, [muro, zonaAgraria, sectorBajo, sectorMedio])).
visito(zuko, reinoTierra(baSingSe, [muro, zonaAgraria, sectorBajo, sectorMedio])).
visito(toph, reinoTierra(fortalezaDeGralFong, [cuartel, dormitorios, enfermeria, salaDeGuerra, templo, zonaDeRecreo])).
visito(aang, nacionDelFuego(palacioReal, 1000)).
visito(katara, tribuAgua(norte)).
visito(katara, tribuAgua(sur)).
visito(aang, temploAire(norte)).
visito(aang, temploAire(oeste)).
visito(aang, temploAire(este)).
visito(aang, temploAire(sur)).

/*saber qué personaje esElAvatar.
 El avatar es aquel personaje que controla todos los elementos básicos.*/

 esElAvatar(Personaje):-
    esPersonaje(Personaje),
    forall(controla(Personaje,Elemento),esElementoBasico(Elemento)).

/*clasificar a los personajes en 3 grupos:
un personaje noEsMaestro si no controla ningún elemento,
 ni básico ni avanzado;
un personaje esMaestroPrincipiante si controla algún
 elemento básico pero ninguno avanzado;
un personaje esMaestroAvanzado si controla algún elemento avanzado.
 Es importante destacar que el avatar también es un maestro avanzado.*/
clasificacionMaestro(Personaje,Clasificacion):-
    esPersonaje(Personaje),
    clasificacion(Personaje,Clasificacion).


clasificacion(Personaje,noEsMaestro):-
    not(controla(Personaje,_)).

clasificacion(Personaje,esMaestroPrincipiante):-
    controla(Personaje,Elemento),
    esElementoBasico(Elemento),
    not(elementoAvanzadoDe(_,Elemento)).

clasificacion(Personaje,esMaestroAvanzado):-
    controla(Personaje,Elemento),
    elementoAvanzadoDe(_,Elemento).
clasificacion(Personaje,esMaestroAvanzado):-
    esElAvatar(Personaje).

/*saber si un personaje sigueA otro. Diremos que esto sucede si el segundo
 visitó todos los lugares que visitó el primero. También sabemos que zuko sigue a aang.*/

 sigueA(Personaje,Seguidor):-
    esPersonaje(Personaje),
    esPersonaje(Seguidor),
    forall(visito(Personaje,Lugar),visito(Seguidor,Lugar)).

sigueA(aang,zuko).

/*conocer si un lugar esDignoDeConocer, para lo que sabemos que:
todos los templos aire son dignos de conocer;
la tribu agua del norte es digna de conocer;
ningún lugar de la nación del fuego es digno de ser conocido;
un lugar del reino tierra es digno de conocer si no tiene muros en su estructura. 
*/
esDignoDeConocer(Lugar):-
    visito(_,Lugar),
    esLugarDigno(Lugar).

esLugarDigno(temploAire(_)).
esLugarDigno(tribuAgua(norte)).
esLugarDigno(reinoTierra(_, Estructura)):-
    not(member(muro,Estructura)).

/*definir si un lugar esPopular, lo cual sucede cuando fue visitado
 por más de 4 personajes. */

 esPopular(Lugar):-
    visito(_,Lugar),
    findall(Personaje,visito(Personaje,Lugar),ListaDeVisitantes),
    length(ListaDeVisitantes,CantidadDeVisitantes),
    CantidadDeVisitantes > 4.