import suscripciones.*

class Juego
{
    const nombre
    const precio
    const categoria

    method perteneceA(unaCategoria)=
        unaCategoria == categoria

    method seLlama(unNombre)=
        unNombre == nombre
    
    method serJugado(unaPersona,unasHoras)

}

class JuegoViolento inherits Juego
{
    override method serJugado(unaPersona,unasHoras)
    {
        unaPersona.bajarHumor(unasHoras * 10)
    }
}

class JuegoEstrategico inherits Juego
{
    override method serJugado(unaPersona,unasHoras)
    {
        unaPersona.subirHumor(unasHoras * 5)
    }
}

class JuegoMoba inherits Juego
{
    override method serJugado(unaPersona,unasHoras)
    {
        unaPersona.comprarSkins()
    }
}

class JuegoDeMiedo inherits Juego
{
    override method serJugado(unaPersona,unasHoras)
    {
        unaPersona.gritar("biip") 
        unaPersona.pasarseASuscripcion(Infantil)
    }
}