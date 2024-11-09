 class Sueno {
    //const fueCumplido = false
    const felicidadOtorgada

    method serCumplidoPor(unaPersona)
    {
        if(self.puedeCumplirlo(unaPersona))
        {
        unaPersona.aumentarFelicidad(felicidadOtorgada)
        }
    }

    method puedeCumplirlo(unaPersona)
 }
 
class Recibirse inherits Sueno
{   
    const deseoDeRecibirse

    override method puedeCumplirlo(unaPersona) =
        unaPersona.quiereEstudiar(deseoDeRecibirse) && unaPersona.noEstaRecibidaDe(deseoDeRecibirse)
        
    
}

object tenerUnHijo inherits Sueno(felicidadOtorgada=0){

    override method puedeCumplirlo(unaPersona) = true

        override method serCumplidoPor(unaPersona)
    {
        if(self.puedeCumplirlo(unaPersona))
        {
        unaPersona.aumentarFelicidad(felicidadOtorgada)
         unaPersona.adoptar()
        }
       
    }
    }

object adoptarHijos inherits Sueno(felicidadOtorgada=0){
    override method puedeCumplirlo(unaPersona) =
        unaPersona.noTieneHijos()

    override method serCumplidoPor(unaPersona)
    {
       if(self.puedeCumplirlo(unaPersona))
        {
        unaPersona.aumentarFelicidad(felicidadOtorgada)
         unaPersona.adoptar()
        }
    }
}

class ViajarA inherits Sueno{}

class ObtenerLaburo inherits Sueno{
    const pago
    override method puedeCumplirlo(unaPersona) =
        unaPersona.estaDeAcuerdoCon(pago)

}

class SuenoMultiple inherits Sueno{
    const listaDeSuenos = []

    override method puedeCumplirlo(unaPersona) =
        listaDeSuenos.all({unSueno => unSueno.puedeCumplirlo(unaPersona)})
}