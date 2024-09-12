% receta(Plato, Duración, Ingredientes)
receta(empanadaDeCarneFrita, 20, [harina, carne, cebolla, picante, aceite]).
receta(empanadaDeCarneAlHorno, 20, [harina, carne, cebolla, picante]).
receta(lomoALaWellington, 125, [lomo, hojaldre, huevo, mostaza]).
receta(pastaTrufada, 40, [spaghetti, crema, trufa]).
receta(souffleDeQueso, 35, [harina, manteca, leche, queso]).
receta(tiramisu, 30, [vainillas, cafe, mascarpone]).
receta(rabas, 20, [calamar, harina, sal]).
receta(parrilladaDelMar, 40, [salmon, langostinos, mejillones]).
receta(sushi, 30, [arroz, salmon, sesamo, algaNori]).
receta(hamburguesa, 15, [carne, pan, cheddar, huevo, panceta, trufa]).
receta(padThai, 40, [fideos, langostinos, vegetales]).

% elabora(Chef, Plato)
elabora(guille, empanadaDeCarneFrita).
elabora(guille, empanadaDeCarneAlHorno).
elabora(vale, rabas).
elabora(vale, tiramisu).
elabora(vale, parrilladaDelMar).
elabora(ale, hamburguesa).
elabora(lu, sushi).
elabora(mar, padThai).

% cocinaEn(Restaurante, Chef)
cocinaEn(pinpun, guille).
cocinaEn(laPececita, vale).
cocinaEn(laParolacha, vale).
cocinaEn(sushiRock, lu).
cocinaEn(olakease, lu).
cocinaEn(guendis, ale).
cocinaEn(cantin, mar).
cocinaEn(cajaTaco,mar).

% tieneEstilo(Restaurante, Estilo)
% italiano(CantidadDePastas)
% oriental(País)
% bodegon(Barrio, PrecioPromedio)
% mexicano(VariedadDeAjies)
% comidaRapida(cantidadDeCombos)
tieneEstilo(pinpun, bodegon(parqueChas, 6000)).
tieneEstilo(laPececita, bodegon(palermo, 20000)).
tieneEstilo(laParolacha, italiano(15)).
tieneEstilo(sushiRock, oriental(japon)).
tieneEstilo(olakease, oriental(japon)).
tieneEstilo(cantin, oriental(tailandia)).
tieneEstilo(cajaTaco, mexicano([habanero, rocoto])).
tieneEstilo(guendis, comidaRapida(5)).

%esChef(NombreDeChef). Agregado para generar los diferentes chefs solo una vez
esChef(guille).
esChef(vale).
esChef(lu).
esChef(ale).
esChef(mar).

/*😎esCrack/1: un o una chef es crack si trabaja en por lo menos dos restaurantes o cocina pad thai.*/

esCrack(Chef):-
    esChef(Chef),
    trabajaEn2LugaresPorLoMenos(Chef).
esCrack(Chef):-
    esChef(Chef),
    elabora(padThai,Chef).

trabajaEn2LugaresPorLoMenos(Chef):-
    cocinaEn(UnRestaurante,Chef),
    cocinaEn(OtroRestaurante,Chef),
    UnRestaurante \=OtroRestaurante.

/*esOtaku/1: un o una chef es otaku cuando solo trabaja en restaurantes de comida japonesa. */

esOtaku(Chef):-
    esChef(Chef),
    forall(cocinaEn(Restaurante,Chef),tieneEstilo(Restaurante,oriental(japonesa))).

/*esTop/1: un plato es top si sólo lo elaboran chefs cracks.*/

esTop(Plato):-
    elabora(_,Plato),
    forall(elabora(Chef,Plato),esCrack(Chef)).

/* un plato es difícil cuando tiene una duración de más de dos horas o tiene trufa como
 ingrediente o es un soufflé de queso.*/
 
esPlatoDificil(Plato):-
    receta(Plato,Duracion,Ingredientes),
    esComplejoDeHacer(Plato,Duracion,Ingredientes).

esComplejoDeHacer(_,Duracion,_):-
    Duracion >120.
esComplejoDeHacer(_,_,Ingredientes):-
    member(trufa,Ingredientes).
esComplejoDeHacer(souffleDeQueso,_,_).

/* un restaurante se merece la estrella Michelin cuando tiene un o una chef crack y
 su estilo de cocina es michelinero.
 Esto sucede cuando es un restaurante:
de comida oriental de Tailandia,
un bodegón de Palermo,
italiano de más de 5 pastas,
mexicano que cocine, por lo menos, con ají habanero y rocoto,
*/
mereceEstrellaMichelin(Restaurante):-
    tieneChefCrack(Restaurante),
    tieneEstilo(Restaurante,Estilo),
    esEstiloMichelinero(Estilo).

tieneChefCrack(Restaurante):-
    cocinaEn(Restaurante,Chef),
    esCrack(Chef).

esEstiloMichelinero(oriental(tailandia)).
esEstiloMichelinero(bodegon(palermo,_)).
esEstiloMichelinero(italiano(CantidadDePastas)):-
    CantidadDePastas > 5.
esEstiloMichelinero(mexicano(VariedadDeAjies)):-
    member(habanero,VariedadDeAjies),
    member(rocoto,VariedadDeAjies).

/*tieneMayorRepertorio/2: según dos restaurantes, se cumple cuando el primero tiene
 un o una chef que elabora más platos que el o la chef del segundo.*/

tieneMayorRepertorio(UnRestaurante,OtroRestaurante):- %Da false cuando la cantidad de paltos es igual.
    cocinaEn(UnRestaurante,UnChef),
    cocinaEn(OtroRestaurante,OtroChef),
    UnRestaurante \= OtroRestaurante,
    puedeElaboraMasPlatos(UnChef,OtroChef).

puedeElaboraMasPlatos(UnChef,OtroChef):-
    cantidadDePlatosQueElabora(UnChef,UnaCantidadDePlatos),
    cantidadDePlatosQueElabora(OtroChef,OtraCantidadDePlatos),
    UnaCantidadDePlatos > OtraCantidadDePlatos.

cantidadDePlatosQueElabora(Chef,CantidadDePlatos):-
    esChef(Chef),
    findall(Plato,elabora(Chef,Plato),ListaDePlatosQueElabora),
    length(ListaDePlatosQueElabora,CantidadDePlatos).

/*calificacionGastronomica/2: la calificación de un restaurante es 5 veces la cantidad
 de platos que elabora el o la chef de este restaurante. */

 calificacionGastronomica(Restaurante,Calificacion):-
    cocinaEn(Restaurante,Chef),
    cantidadDePlatosQueElabora(Chef,CantidadDePlatos),
    Calificacion is  5*CantidadDePlatos.