import entradas.*
import asistentes.*
import bandas.*
import abonos.*
object pdpEntertainment {
  var impuestoPropio = 100 //Agrego un numero para que funcione
  var asistentesAlShow = #{}
  var bandasQueAsisten = #{}

  method gananciasDelShow()=
    self.recaudacionDelShow() - self.presupuestoDeLasBandas()

  method recaudacionDelShow()=
    asistentesAlShow.sum({unAsistente => unAsistente.gastoEnEntradas()})
  
  method presupuestoDeLasBandas()=
        bandasQueAsisten.sum({unaBanda => unaBanda.presupuesto()})

  method impuestoPropio() = impuestoPropio

  method impuestoPropio(unNuevoImpuesto) { //"Podria variar cuando la productora quiera"
    impuestoPropio = unNuevoImpuesto
  }

  method bonificarLosVips()
  {
    const asistentesVip = asistentesAlShow.filter({unAsistente => self.esVip(unAsistente)})
    asistentesVip.forEach({unAsistente => unAsistente.bonificarAbono(1)})
  }

  method esVip(unAsistente)=
    AbonoVip == unAsistente.abono()

  method bandaMasPopular()=
    bandasQueAsisten.max({unaBanda => unaBanda.popularidad()})

  method cantidadDeEntradasVenidadas()=
    asistentesAlShow.sum({unAsistente => unAsistente.cantidadDehowsALosQueFue()})
}