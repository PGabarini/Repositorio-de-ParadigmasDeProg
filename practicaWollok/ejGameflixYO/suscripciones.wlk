class Suscripcion
{
    const precioSuscripcion

    method precioSuscripcion() = precioSuscripcion

    method puedeJugar(unJuego) = true
}

const premium = new Suscripcion (precioSuscripcion = 50)

class Base inherits Suscripcion
{
    override method puedeJugar(unJuego) = 
        unJuego.valeMenosQue(30)
}

class SuscripcionSegunTipo inherits Suscripcion
{
    const tipo
    override method puedeJugar(unJuego) = 
        unJuego.perteneceA(tipo)
}

const Infantil = new SuscripcionSegunTipo (precioSuscripcion = 10, tipo = "infantil" )
const Gratis = new SuscripcionSegunTipo (precioSuscripcion = 0, tipo = "demo" )