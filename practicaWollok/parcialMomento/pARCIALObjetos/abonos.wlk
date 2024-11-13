object abonoFan
{
    method descontar(unPrecio) = unPrecio
}

class AbonoVip
{
    var descuentoUnico

    method descontar(unPrecio) = 
        unPrecio * descuentoUnico

    method aumentarDescuento(unaCantidad)
    {
        descuentoUnico += unaCantidad
    }
}