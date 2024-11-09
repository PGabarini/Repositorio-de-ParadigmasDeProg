import beth.Beth
import exceptiosPropias.*

class Summer inherits Beth {
  override method irseDeAventurasCon(unRick) {
    if (self.esLunes()) {
      super(unRick)
    } else {
      throw new SoloPuedoIrmeDeAventurasLosLunesException()
    }
  }

  method esLunes() {
    return new Date().dayOfWeek() == "monday"
  }
}