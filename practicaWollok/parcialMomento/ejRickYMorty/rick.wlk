import exceptiosPropias.*

class Rick {
  var nivelDeDemencia
  const acompaniante

  method irDeAventuras() {
    try {
      acompaniante.irseDeAventurasCon(self)
    } catch unaException : NoPuedoIrmeDeAventurasException {
      self.noPuedoIrDeAventuras()
    }
  }

  method sumarNivelDeDemencia(unaCantidad) {
    nivelDeDemencia += unaCantidad
  }

  method noPuedoIrDeAventuras() {
    self.sumarNivelDeDemencia(1000)
  }
}