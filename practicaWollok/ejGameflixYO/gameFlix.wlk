import misExcepciones.*

object gameFlix{
    var clientes = #{}
    var catalogo = []

    method filtrarCategoria(unaCategoria)=
        catalogo.filter({unJuego => unJuego.perteneceA(unaCategoria)})
    
    method buscarJuego(unNombre)=
        catalogo.findOrElse(({unJuego => unJuego.seLlama(unNombre)}),throw new NoEstaElJuegoException())
    
    method recomendarJuego()=
        catalogo.anyOne()

    method actualizarSuscripcion(unaPersona,unaSuscripcion)
    {
        unaPersona.pasarseA(unaSuscripcion)
    }

    method cobrarSuscripciones()
    {
        clientes.forEach({unCliente => self.cobrarSuscripcion(unCliente)})
    }

    method cobrarSuscripcion(unCliente)
    {
        unCliente.pagarSuscripcion()
    }
}