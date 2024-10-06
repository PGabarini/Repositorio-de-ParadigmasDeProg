import armas.glamdring
import armas.baculoDeGandalf

class Hobbit inherits Guerrero{

  override method poder() = vida + self.sumatoriaDelPoderDeArmas() + items.size()
}

class Enano inherits Guerrero{


  const factorDePoder

  override method poder() = vida + factorDePoder * self.sumatoriaDelPoderDeArmas()

  
}

class Elfo inherits Guerrero{

  var property destrezaBase = 2
  const destrezaPropia

  override method poder() = vida + (destrezaBase + destrezaPropia) * self.sumatoriaDelPoderDeArmas()

}

class Humano inherits Guerrero{
  

  const limitadorDePoder

  override method poder() = vida * self.sumatoriaDelPoderDeArmas() / limitadorDePoder
 
}

class Maiar inherits Guerrero{
  
  const factor

  override method poder() = vida * self.factorDeAmenza(factor) + self.sumatoriaDelPoderDeArmas() * 2

  method factorDeAmenza(unFactor) {

    if(unFactor == "Basico")
    {
      return 15
    }
    else{return 300}
  }

}

class Guerrero{
  var property vida
  var armas = #{}
  const items = #{}

  method vida()= vida

  method armas(conjuntoDeArmas) {
        armas = conjuntoDeArmas
    }
  
  method sumatoriaDelPoderDeArmas() = armas.sum({unArma => unArma.poder()})

  method poder() 

  method calcularPoder(multiplicador) = vida * multiplicador + self.sumatoriaDelPoderDeArmas() * 2
    
  method tieneSuficientePoder(unPoder) = self.poder() > unPoder

  method tieneArmas() = not armas.isEmpty()

  method puedeAtravesar(zona) = zona.condicionParaPasar().apply(self)

  // Al aplicar la consecuencia de pasar por un camino se asevera que la vida no termine siendo mayor a 100 ni menor a 0 
  method recorrer(zona) {
      vida = ((vida + zona.consecuenciaDePasar()).max(0)).min(100) // consecuenciaDePasar puede ser negativo o positivo
  }

   method cumpleCondicionDeGuerrro(zona) = zona.requerimientoDeGuerrero().aplly(self)

   method tieneEnSuInventario(unItem) = items.contains(unItem)

   method cantidadDe(unItem) = items.count(unItem)
}


object tomBombadil inherits Guerrero(vida = 100){

    override method poder() = 1000
    override method puedeAtravesar(zona) = true
    override method recorrer(zona) {}
}

object gollum inherits Hobbit(vida = 100){

  override method poder() = super() / 2
    
}

object gandalf inherits Maiar(vida = 100,armas = #{glamdring,baculoDeGandalf},factor ="Basico"){
    
    override method poder() =
    if (vida >= 10){
      self.calcularPoder(15)
    } else {
      self.calcularPoder(300)
    }
    
}