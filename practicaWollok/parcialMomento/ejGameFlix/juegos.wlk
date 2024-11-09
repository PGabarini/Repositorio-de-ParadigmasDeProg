import suscripciones.infantil

class Juego {
  const nombre
  const precio
  const categoria

  method nombre()= nombre
  
  method perteneceACategoria(unaCategoria) {
    return unaCategoria == categoria
  }

  method seLlama(unNombre) {
    return unNombre == nombre
  }

  method afectarA(unCliente, unasHoras)

  method saleMenosQue(unaCantidad) {
    return precio < unaCantidad
  }
}

class JuegoViolento inherits Juego {
  override method afectarA(unCliente, unasHoras) {
    unCliente.bajarHumor(10 * unasHoras)
  }
}

class Moba inherits Juego {
  override method afectarA(unCliente, unasHoras) {
    unCliente.pagar(30)
  }
}

class JuegoDeTerror inherits Juego {
  override method afectarA(unCliente, unasHoras) {
    unCliente.suscripcion(infantil)
  }
}

class JuegoEstrategico inherits Juego {
  override method afectarA(unCliente, unasHoras) {
    unCliente.aumentarHumor(5 * unasHoras)
  }
}

const terraria =  new JuegoEstrategico(nombre =  "Terraria",precio =  15, categoria = "Estrategia")