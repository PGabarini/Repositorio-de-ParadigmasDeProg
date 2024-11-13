// ABONO DE ASISTENTE CAMBIA
import entradas.*
import misExcepciones.*
import abonos.*
class Asistente
{
    var abono
    var historialDeEntradas = []
    var dinero

    method abono()=abono

    method comprarEntradaPara(unaBanda,unaFecha)
    {
       if (self.tieneDinero())
       {
        const entrada = new Entrada(bandaQueToca = unaBanda,fechaDeShow = unaFecha)
        const precioAPagar = abono.descontar(entrada.precio())

        self.pagar(precioAPagar)
        historialDeEntradas.add(entrada)

       }else {throw new MeQuedeSinPlataException()}

    }

    method tieneDinero()=
        dinero > 0

    method pagar(unaCantidad)
    {
        dinero -= unaCantidad
    }

    method entradasQueSacoElAnoPasado()=
        historialDeEntradas.filter({ unaEntrada => unaEntrada.fueElAnoPasado() })


    method bandasQueComproEntrada()=
         historialDeEntradas.map({unaEntrada => unaEntrada.bandaQueToca()})

    method gastoEnEntradas()=
        historialDeEntradas.sum({unaEntrada => unaEntrada.precio()})

    method cantidadDehowsALosQueFue()=
        historialDeEntradas.size()

    method bonificarAbono(unaCantidad)
    {
        abono.aumentarDescuento(unaCantidad)
    }
}