import construcciones.*

class Persona{
    const lugarDondeVive
    var monedas =20

    var edad

    method recursos()= monedas

    method ganarMonedas(unaCantidad)
    {
        monedas += unaCantidad
    }

    method gastarMonedas(unaCantidad)
    {
        monedas -= unaCantidad
    }

    method esDestacado() = edad.between(18,65) || self.recursos() >30

    method cumplirAnos() 
    {edad += 1}

    method trabajarEn(unPlaneta,unTiempo){}

}

class PersonaProductora inherits Persona{
    
    var tecnicasConocidas = #{"cultivo"}

    override method recursos() = super()  * tecnicasConocidas.size()

    override method esDestacado() = super() || tecnicasConocidas.size() > 5

    method realizar(unaTecnica,unTiempo)
        {
            if(self.conoce(unaTecnica))
            {
                self.ganarMonedas(3 * unTiempo)
            }else{
                self.gastarMonedas(1)
            }
        }

    method conoce(unaTecnica)=
        tecnicasConocidas.find(unaTecnica)

    method aprender(unaTecnica){
        tecnicasConocidas.add(unaTecnica)
    }

    override method trabajarEn(unPlaneta,unTiempo)
    {
        if(lugarDondeVive == unPlaneta)
        {
            self.realizar(tecnicasConocidas.get(0),unTiempo)
        }
    }
}

class PersonaConstructora inherits Persona{
    
    var construccionesRealizadas = #{"cultivo"}

    override method recursos() = super()  * construccionesRealizadas.size()

    override method esDestacado() = construccionesRealizadas.size() > 5


    override method trabajarEn(unPlaneta,unTiempo)
    {       
            const nuevaConstruccion = lugarDondeVive.construccionDeLaZona(self,unTiempo)
            unPlaneta.contruir(nuevaConstruccion)
            self.gastarMonedas(5)
    }
}

object regionMontana
{
    method construccionDeLaZona(unConstructor,unTiempo)=  new Muralla (longitud = (unTiempo/2))
}

object regionCosta{
    method construccionDeLaZona(unConstructor,unTiempo) = new Museo (supCubierta=unTiempo,indiceDeImportancia= 1)

}

object regionLlanura{
    method construccionDeLaZona(unConstructor,unTiempo){
        if(!unConstructor.esDestacado())
        {
            return new Museo (supCubierta=unTiempo,indiceDeImportancia= 1)
        }else{
        const proporcionDeRecursos
        return new Museo (supCubierta=unTiempo,indiceDeImportancia= proporcionDeRecursos)
        }
    }
}