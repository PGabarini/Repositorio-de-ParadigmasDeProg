// Well Known Object (WKO)
object manic {
// Estado
    var estrellas=0
    var cantidadDeGlobos = 80


// Comportamiento
    method encontrarEstrellas() {
        estrellas += 8
    }

    method regalarEstrella() {
        estrellas -= 1
    }
    
    method tieneTodoListo() = estrellas >=4 

    method tieneGlobosSuficientes() = cantidadDeGlobos >50

    method comprarGlobos() {
    cantidadDeGlobos +=15
  }
}


object chuy {
  var cantidadDeGlobos = 50
  method tieneTodoListo() = true

  method comprarGlobos() {
    cantidadDeGlobos +=15
  }

  method tieneGlobosSuficientes() = cantidadDeGlobos >50

}

object capy {
  var cantidadDeGlobos = 28
  var latasRecolectadas=10

  method recolectarLatas() {
    latasRecolectadas += 1
  }

  method reciclarLatas() {
    latasRecolectadas -= 5
  }

  method tieneTodoListo() = latasRecolectadas.even() 

  
  method comprarGlobos() {
    cantidadDeGlobos +=15
  }

  method tieneGlobosSuficientes() = cantidadDeGlobos >50
}

object fiestaDeGuyra {
  var property quienOrganiza =  manic

    method estaPreparadaLaFiesta() =
        quienOrganiza.tieneTodoListo() && quienOrganiza.tieneGlobosSuficientes() 
  
}

// Interfaz: Conjunto de mensajes que entiende un objeto.

// Interfaz de manic:
// encontrarEstrellas()
// regalarEstrellas()
// estrellas()
// estrellas(unaCantidad)
// tieneTodoListo()
// globos()
// tieneSuficientesGlobos()