import armas.glamdring
import armas.baculo
object gandalf {
    var property vida = 100
    var armas = #{baculo, glamdring}

    method armas(conjuntoDeArmas) {
        armas = conjuntoDeArmas
    }
    
    method poder() =
    if (vida >= 10){
      self.calcularPoder(15)
    } else {
      self.calcularPoder(300)
    }

    method calcularPoder(multiplicador) = vida * multiplicador + self.poderDeArmas() * 2
    
    method poderDeArmas() = armas.sum({arma => arma.poder()})

    method tieneSuficientePoder(unPoder) = self.poder() > unPoder
    method tieneArmas() = not armas.isEmpty()

    method puedeAtravesar(zona) = zona.condicionParaPasar().apply(self)

    // Al aplicar la consecuencia de pasar por un camino se asevera que la vida no termine siendo mayor a 100 ni menor a 0 
    method recorrer(zona) {
        vida = ((vida + zona.consecuenciaDePasar()).max(0)).min(100) // consecuenciaDePasar puede ser negativo o positivo
    }
}

object tomBombadil {
    method puedeAtravesar(zona) = true
    method recorrer(zona) {}
}