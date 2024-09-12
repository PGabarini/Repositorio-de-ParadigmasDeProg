
object delfina{
    var diversion = 0
    var consolaEnMano=play

    method jugar(juego){
        diversion += juego.diversion(consolaEnMano)

        consolaEnMano.usar()
    }

    method diversion() = diversion

    method agarrar(consola){consolaEnMano =  consola}
}

//consolas
object play{
    method jugabilidad() = 10
    method usar(){}
}

object portatil{
    var bateria = "alta"

    method jugabilidad() = if (bateria=="alta") {8}
                                else{1}
    method usar(){bateria = "baja"}
}

//juegos
object arkanoid{

    method diversion(consola) = 50
}

object mario{

    method diversion(consola) = if (5 < consola.jugabilidad() ) {100}
                                    else{15}
}

object pokemon{
    method diversion(consola)= 10 * consola.jugabilidad()
}