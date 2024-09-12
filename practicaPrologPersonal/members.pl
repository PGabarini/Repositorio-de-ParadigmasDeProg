/*Desarrollar duoDiferenciable/2, que relaciona a un dúo (dos amigos o una pareja)
 en el que uno tiene al menos una característica que el otro no. 
*/
/*
duoDiferenciable(Personaje,OtroPersonaje):-
    caracteristicas(Personaje,Caracteristicas),
    caracteristicas(OtroPersonaje,OtrasCaracteristicas),
    Personaje \=OtroPersonaje,
    member(Caracteristica,Caracteristicas),
    not(member(Caracteristica,OtrasCaracteristicas)),
     sonConocidos(Personaje,OtroPersonaje).*/

/*
noSeCruzaron(Persona,OtraPersona):-
    persona(Persona),
    persona(OtraPersona),
    not((viajaA(Persona,Lugar),viajaA(OtraPersona,Lugar))).*/