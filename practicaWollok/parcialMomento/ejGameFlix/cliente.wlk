import exceptiosPropias.*
import suscripciones.*
import juegos.*
class Cliente {
  var humor
  var plata
  var suscripcion

  method suscripcion(unaSuscripcion) {
    suscripcion = unaSuscripcion
  }

  method pagar(unaCantidad) {
    if (plata < unaCantidad) {
      throw new MeQuedeSinPlataException()
    }

    plata -= unaCantidad
  }

  method aumentarHumor(unaCantidad) {
    humor += unaCantidad
  }

  method bajarHumor(unaCantidad) {
    humor -= unaCantidad
  }

  method pagarSuscripcion() {
    try {
      self.pagar(suscripcion.precio())
    } catch unError : MeQuedeSinPlataException {
      self.suscripcion(prueba)
    }
  }

  method jugar(unJuego,unasHoras){

    if(suscripcion.puedeJugar(unJuego))
    {
    unJuego.afectarA(self,unasHoras)
    }else(throw new NoPuedoJugarEsteJuegoException(nombreDeJuego = unJuego.nombre()))
  }
}