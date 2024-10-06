
import gondor.*
class Zona {

    const condicionParaPasar = {true}// bloque que toma un habitante y vera si puede pasar

    const requerimientoDeCantidadDeItem = 0

    const requerimientoDeItem = " "

    const requerimientoDeGuerrero = {true} // bloque que toma un habitante y vera si cumple la condicion de guerrero

    const consecuenciasDePasar =  0// consecuencia numerica sobre la vida de quien atraviese


    method condicionParaPasar() = condicionParaPasar

    method consecuenciasDePasar() = consecuenciasDePasar

    method requerimientoDeCantidadDeItem() = requerimientoDeCantidadDeItem

    method requerimientoDeItem () = requerimientoDeItem

    method requerimientoDeGuerrero() =  requerimientoDeGuerrero
    

    method dejarAtravesarGrupo(grupoDeGuerreros) {

        if (self.cumpleRequerimientoDeGrupo(grupoDeGuerreros))     
        {
             grupoDeGuerreros.forEach({unGuerrero => self.dejarAtravesarHabitante(unGuerrero)}) 
        }
    }
    
    method cumpleRequerimientoDeGrupo(grupoDeGuerreros) =   
        self.cumplenRequerimientoDeItem(grupoDeGuerreros) && 
        grupoDeGuerreros.any({unGuerrero => unGuerrero.cumpleCondicionDeGuerrro(self)})

        
    method cumplenRequerimientoDeItem(grupoDeGuerreros) =
        grupoDeGuerreros.any({unGuerrero => unGuerrero.tieneEnSuInventario(requerimientoDeItem)}) &&
        requerimientoDeCantidadDeItem < grupoDeGuerreros.sum({unGuerrero => unGuerrero.cantidadDe(requerimientoDeItem)})
        

    method dejarAtravesarHabitante(unHabitante) {
        if (unHabitante.puedeAtravesar(self)) {
            unHabitante.recorrer(consecuenciasDePasar)
        }
    }


}

class Camino {
    var zonasDelRecorrido // set de zonas que componen el camino
    method zonasDelRecorrido(conjuntoDeZonas) {
        zonasDelRecorrido = conjuntoDeZonas
    }

    method dejarAtravesar(grupoDeGuerreros) {
        zonasDelRecorrido.forEach({zona => zona.dejarAtravesarGrupo(grupoDeGuerreros)})
    }
}



const lossarnach = new Zona(condicionParaPasar = {true},
                            consecuenciasDePasar = 1,
                            requerimientoDeCantidadDeItem =0,
                            requerimientoDeGuerrero = {true},
                            requerimientoDeItem = " "
                            )   

