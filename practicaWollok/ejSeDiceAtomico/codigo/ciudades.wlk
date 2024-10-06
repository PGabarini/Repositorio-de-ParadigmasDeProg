import centralesElectricas.atomicaBurns
import centralesElectricas.carbonExBosque
import centralesElectricas.eolicaElSuspiro
import centralesElectricas.hidroElectrica

object sprinfield{
    const riquezaDelSuelo = 0.9
    const velocidadDelViento = 10
    const centrales = #{atomicaBurns,carbonExBosque,eolicaElSuspiro}

    method centrales() = centrales

    method riquezaDelSuelo() = riquezaDelSuelo

    method velocidadDelViento() = velocidadDelViento

    method centralesContaminantes () =
         centrales.filter({unaCentral => unaCentral.contamina()})
    

    method cubrioSusNecesidadesEnergeticas(necesidadEnergetica) =
        necesidadEnergetica < self.suministroEnergetico(centrales)

    method suministroEnergetico (unasCentrales) = unasCentrales.sum({unaCentral => unaCentral.produccionEnergetica(self)})

    method estaAlHorno(necesidadEnergetica) = 
    necesidadEnergetica/2 < self.suministroEnergetico( self.centralesContaminantes() )
    || centrales == self.centralesContaminantes()

    //method tieneSoloCentralesContaminantes() = centrales.all({unaCentral => unaCentral.contamina()})

    method centralMasProductora() = centrales.max({unaCentral => unaCentral.produccionEnergetica(self)})
    
}

object albuquerque{
    const riquezaDelSuelo = 0.2
    const velocidadDelViento = 2
    const caudalDelRio = 150
    const centrales = #{hidroElectrica}

    method centrales() = centrales

    method caudalDelRio() = caudalDelRio

    method riquezaDelSuelo() = riquezaDelSuelo

    method velocidadDelViento() = velocidadDelViento

    method centralMasProductora() = centrales.max({unaCentral => unaCentral.produccionEnergetica(self)})
}