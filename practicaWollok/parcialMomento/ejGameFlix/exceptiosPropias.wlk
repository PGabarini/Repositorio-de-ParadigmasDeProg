class NoExisteElJuegoException inherits Exception(message = "¡No existe el juego " + nombreDeJuego + "!") {
  const nombreDeJuego

  method a() = nombreDeJuego
}

class MeQuedeSinPlataException inherits Exception(message = "Me quede sin plata") {

}

class NoPuedoJugarEsteJuegoException inherits Exception(message = "¡No puedo jugar " + nombreDeJuego + "!"){
    const nombreDeJuego

    method a() = nombreDeJuego
    }
