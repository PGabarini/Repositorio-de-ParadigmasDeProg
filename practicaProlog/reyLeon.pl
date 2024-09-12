
/*-vaquitas de San Antonio (de quienes nos interesa un peso),
 -cucarachas (de quienes nos interesa un tamaño y un peso) 
 -hormigas, que pesan siempre lo mismo. */
comio(pumba, vaquitaSanAntonio(gervasia,3)).
comio(pumba, hormiga(federica)).
comio(pumba, hormiga(tuNoEresLaReina)).
comio(pumba, cucaracha(ginger,12,6)).
comio(pumba, cucaracha(erikElRojo,25,70)).
comio(timon, vaquitaSanAntonio(romualda,4)).
comio(timon, cucaracha(gimeno,12,8)).
comio(timon, cucaracha(cucurucha,12,5)).
comio(simba, vaquitaSanAntonio(remeditos,4)).
comio(simba, hormiga(schwartzenegger)).
comio(simba, hormiga(niato)).
comio(simba, hormiga(lula)).
comio(shenzi,hormiga(conCaraDeSimba)).
pesoHormiga(2).

%peso(Personaje, Peso)
peso(pumba, 100).
peso(timon, 50).
peso(simba, 200).
peso(scar, 300).
peso(shenzi, 400).
peso(banzai, 500).
/*Qué cucaracha es jugosita: ó sea, hay otra con su mismo
 tamaño pero ella es más gordita.
?- jugosita(cucaracha(gimeno,12,8)).
Yes*/

cucarachaJugosa(cucaracha(NombreCuca,Tamano,Peso)):-
    comio(_,cucaracha(NombreCuca,Tamano,Peso)),
    comio(_,cucaracha(OtroNombreCuca,Tamano,OtroPeso)),
    NombreCuca \=OtroNombreCuca,
    Peso >OtroPeso.

/*Si un personaje es hormigofílico... (Comió al menos dos hormigas).
?- hormigofilico(X).
X = pumba;
X = simba.*/

esHormigofilico(Personaje):-
    comio(Personaje,hormiga(NombreDeHormiga)),
    comio(Personaje,hormiga(NombreDeOtraHormiga)),
    NombreDeOtraHormiga \= NombreDeHormiga.

/*Si un personaje es cucarachofóbico (no comió cucarachas).
?- cucarachofobico(X).
X = simba*/
cucarachofobico(Personaje):-
    comio(Personaje,_),
    not(comio(Personaje,cucaracha(_,_,_))).

/*Conocer al conjunto de los picarones. Un personaje es picarón 
si comió una cucaracha jugosita ó si se
come a Remeditos la vaquita. Además, pumba es picarón de por sí.
?- picarones(L).
L = [pumba, timon, simba]*/

picarones(LosPicarones):-
    findall(Personaje,esPicaron(Personaje),Picarones),
    list_to_set(Picarones,LosPicarones).

esPicaron(pumba).
esPicaron(Personaje):-
    comio(Personaje,vaquitaSanAntonio(remeditos,4)).
esPicaron(Personaje):-
    cucarachaJugosa(Cucaracha),
    comio(Personaje,Cucaracha).

persigue(scar, timon).
persigue(scar, pumba).
persigue(shenzi, simba).
persigue(shenzi, scar).
persigue(banzai, timon).
persigue(scar, mufasa).


/*Se quiere saber cuánto engorda un personaje 
(sabiendo que engorda una cantidad igual a la suma de
los pesos de todos los bichos en su menú). Los bichos no engordan.
?- cuantoEngorda(Personaje, Peso).
Personaje= pumba
Peso = 83;
Personaje= timon
Peso = 17;*/

%peso de comido
cuantoEngorda(Personaje,PesosGanados):-
    distinct(Personaje,comio(Personaje,_)),
    findall(Peso,pesoDeBichoComido(Personaje,Peso),PesosDeBichosComidos),
    sum_list(PesosDeBichosComidos, PesosGanados).

pesoDeBichoComido(Personaje,Peso):-
    comio(Personaje,Bicho),
    pesoDeBicho(Bicho,Peso).

pesoDeBicho(cucaracha(_,_,Peso),Peso).
pesoDeBicho(vaquitaSanAntonio(_,Peso),Peso).
pesoDeBicho(hormiga(_),2).

%peso de perseguido y comido
cuantoEngorda2(Personaje,PesosGanados):-
    distinct(Personaje,persigue(Personaje,_)),
    findall(Peso,(pesoDePresa(Personaje,Peso)),PesosDePerseguidos),
    sum_list(PesosDePerseguidos, PesosGanados).

pesoDePresa(Personaje,Peso):-
    persigue(Personaje,Perseguido),
    peso(Perseguido,Peso).

pesoDePresa(Personaje,Peso):-
    comio(Personaje,Bicho),
    pesoDeBicho(Bicho,Peso).

pesoDeBicho(cucaracha(_,_,Peso),Peso).
pesoDeBicho(vaquitaSanAntonio(_,Peso),Peso).
pesoDeBicho(hormiga(_),2).
/*Ahora se complica el asunto, porque en realidad cada animal antes de 
comerse a sus víctimas espera a que
estas se alimenten. De esta manera, lo que engorda un animal no es sólo
 el peso original de sus víctimas, sino
también hay que tener en cuenta lo que éstas comieron y por lo tanto engordaron.*/

cuantoEngorda3(Personaje,PesosGanados):-
    distinct(Personaje,persigue(Personaje,_)),
    findall(Peso,(pesoDePresaLuegoDeComer(Personaje,Peso)),PesosDePerseguidos),
    sum_list(PesosDePerseguidos, PesosGanados).

pesoDePresaLuegoDeComer(Personaje,Peso):-
    persigue(Personaje,Perseguido),
    peso(Perseguido,PesoDePerseguido),
    findall(P,(pesoDePresa(Perseguido,P)),PesosDePerseguidos),
    sum_list(PesosDePerseguidos, PesosGanados),
    Peso is PesosGanados + PesoDePerseguido.

/*Sabiendo que todo animal adora a todo lo que no se lo come o no lo
persigue, encontrar al rey. El rey es el animal a quien sólo hay un animal
que lo persigue y todos adoran.*/

rey(Personaje):-
    soloLoSigueUno(Personaje),
    forall((comio(OtroPersonaje,_),Personaje\=OtroPersonaje),loAdora(OtroPersonaje,Personaje)).
    

soloLoSigueUno(Personaje):-
    persigue(P,Personaje),
    not((persigue(X,Personaje),P\=X)).

loAdora(OtroPersonaje,Personaje):-
    not(comio(OtroPersonaje,Personaje)).
loAdora(OtroPersonaje,Personaje):-
    not(persigue(OtroPersonaje,Personaje)).