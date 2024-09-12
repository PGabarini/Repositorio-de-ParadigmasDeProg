import ciudades.*
object atomicaBurns{

    const cantVarillasdeUranio = 10

    method cantVarillasdeUranio() = cantVarillasdeUranio 

    method produccionEnergetica(unaCiudad) = 0.1 * cantVarillasdeUranio

    method contamina() = cantVarillasdeUranio >20 
}

object carbonExBosque{
    const capacidad = 20

    method produccionEnergetica(unaCiudad) = 0.5 + capacidad *  unaCiudad.riquezaDelSuelo()

    method contamina() = true 

}

object eolicaElSuspiro{
    var cantTurbinas = 1

    method produccionEnergetica(unaCiudad){
        self.instalarTurbinas(0)
        return cantTurbinas * self.produccionDeTurbinas(unaCiudad)
    }

    method instalarTurbinas(unaCantidad)
         {cantTurbinas += unaCantidad}

    method produccionDeTurbinas(unaCiudad) = 0.2 * unaCiudad.velocidadDelViento()

    method contamina() = false
      
}

object hidroElectrica{

    method produccionEnergetica(unaCiudad) = 2 * unaCiudad.caudalDelRio() 
}