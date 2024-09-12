herramientasRequeridas(ordenarCuarto, [aspiradora(100), trapeador, plumero]).
herramientasRequeridas(limpiarTecho, [escoba, pala]).
herramientasRequeridas(cortarPasto, [bordedadora]).
herramientasRequeridas(limpiarBanio, [sopapa, trapeador]).
herramientasRequeridas(encerarPisos, [lustradpesora, cera, aspiradora(300)]).

persona(egon).
persona(peter).
persona(winston).
persona(ray).

tiene(egon,aspiradora(200)).
tiene(egon,trapeador).
tiene(egon,plumero).
tiene(peter,trapeador).
tiene(peter,sopapa).
tiene(winston,varitaDeNeutrones).

/*Definir un predicado que determine si un integrante satisface la necesidad de una 
herramienta requerida. Esto será cierto si tiene dicha herramienta, 
teniendo en cuenta que si la herramienta requerida es una aspiradora, 
el integrante debe tener una con potencia igual o superior a la requerida.
Nota: No se pretende que sea inversible respecto a la herramienta requerida.*/

tieneHerramientaRequerida(Persona,Herramienta):-
    persona(Persona),
    herramientasRequeridas(_,HerramientasRequeridas),
    cumpleRequerimiento(Persona,Herramienta,HerramientasRequeridas).

cumpleRequerimiento(Persona,Herramienta,HerramientasRequeridas):-      
        member(Herramienta,HerramientasRequeridas),
        tiene(Persona,Herramienta).

cumpleRequerimiento(Persona,aspiradora(PotenciaRequerida),HerramientasRequeridas):-   
        member(aspiradora(PotenciaRequerida),HerramientasRequeridas),
        tiene(Persona,aspiradora(Potencia)),
        Potencia > PotenciaRequerida.

cumpleRequerimiento(Persona,_,_):-
    tiene(Persona,varitaDeNeutrones).
/*Queremos saber si una persona puede realizar una tarea, que dependerá de las herramientas que tenga.
 Sabemos que:
- Quien tenga una varita de neutrones puede hacer cualquier tarea, 
independientemente de qué herramientas requiera dicha tarea.
- Alternativamente alguien puede hacer una tarea si puede satisfacer la necesidad 
de todas las herramientas requeridas para dicha tarea.*/

puedeRealizarTarea(Persona,Tarea):-
    herramientasRequeridas(Tarea,HerramientasRequeridas),
    persona(Persona),
    forall(member(Herramienta,HerramientasRequeridas),tieneHerramientaRequerida(Persona,Herramienta)).

/*Nos interesa saber de antemano cuanto se le debería cobrar a un cliente por un pedido 
(que son las tareas que pide). Para ellos disponemos de la siguiente información en la base de conocimientos:
- tareaPedida/3: relaciona al cliente, con la tarea pedida y la cantidad de metros cuadrados sobre los 
cuales hay que realizar esa tarea.
- precio/2: relaciona una tarea con el precio por metro cuadrado que se cobraría al cliente.
Entonces lo que se le cobraría al cliente sería la suma del valor a cobrar por cada tarea,
 multiplicando el precio por los metros cuadrados de la tarea.
*/

%tareaPedida(tarea, cliente, metrosCuadrados).
tareaPedida(ordenarCuarto, dana, 20).
tareaPedida(cortarPasto, walter, 50).
tareaPedida(limpiarTecho, walter, 70).
tareaPedida(limpiarBanio, louis, 15).

%precio(tarea, precioPorMetroCuadrado).
precio(ordenarCuarto, 13).
precio(limpiarTecho, 20).
precio(limpiarBanio, 55).
precio(cortarPasto, 10).
precio(encerarPisos, 7).

precioACobrar(Cliente,PrecioTotal):-
    tareaPedida(_,Cliente,_),
    findall(Precio,(precioACobrarPorTareaPedida(Cliente,Precio)),ListaDePrecios),
    sum_list(ListaDePrecios,PrecioTotal).

precioACobrarPorTareaPedida(Cliente,Precio):-
    tareaPedida(Tarea,Cliente,Mts),
    precioPorMetrosSegunTarea(Mts,Tarea,Precio).

precioPorMetrosSegunTarea(Mts,Tarea,Precio):-
    precio(Tarea,PrecioXMetro),
    Precio is PrecioXMetro * Mts.

/*Finalmente necesitamos saber quiénes aceptarían el pedido de un cliente. 
Un integrante acepta el pedido cuando puede realizar todas las tareas del pedido y
 además está dispuesto a aceptarlo.
-Sabemos que Ray sólo acepta pedidos que no incluyan limpiar techos,
- Winston sólo acepta pedidos que paguen más de $500,
 Egon está dispuesto a aceptar pedidos
 que no tengan tareas complejas
- y Peter está dispuesto a aceptar cualquier pedido.
Decimos que una tarea es compleja si requiere más de dos herramientas.
 Además la limpieza de techos siempre es compleja.*/

quienAceptaElPedido(Persona,Cliente):-
    persona(Persona),
    tareaPedida(_,Cliente,_),
    forall(tareaPedida(Tarea,Cliente,_),aceptaLaTarea(Persona,Tarea,Cliente)).

aceptaLaTarea(Persona,Tarea,Cliente):-
    puedeRealizarTarea(Persona,Tarea),
    estaDispuesto(Persona,Tarea,Cliente).

estaDispuesto(peter,_,_).
estaDispuesto(ray,Tarea,_):-
    Tarea \= limpiarTecho.
estaDispuesto(winston,_,Cliente):-
    precioACobrar(Cliente,PrecioTotal),
    PrecioTotal > 500.
estaDispuesto(egon,Tarea,_):-
    not(esTareaCompleja(Tarea)).

esTareaCompleja(limpiarTecho).
esTareaCompleja(Tarea):-
    herramientasRequeridas(Tarea,HerramientasRequeridas),
    member(Herramienta,HerramientasRequeridas),
    member(OtraHerramienta,HerramientasRequeridas),
    Herramienta \=OtraHerramienta.