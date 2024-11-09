import suscripciones.*

class Persona
{
    var suscripcion
    var humor
    var dinero
    
    method jugarJuego(unJuego,unasHoras)
    {
        if(suscripcion.puedeJugar(unJuego))
        {
            unJuego.serJugado(self,unasHoras)
        }
    }

    method pasarseA(unaSuscripcion)
    {
        suscripcion == unaSuscripcion
    }

    method pagarSuscripcion()
    {
        if(dinero > suscripcion.precioSuscripcion())
        {
            self.pagar(suscripcion.precioSuscripcion())

        }else{self.pasarseA(Gratis)}
    }

    method pagar(unaCantidad){
        dinero -= unaCantidad
    }
}