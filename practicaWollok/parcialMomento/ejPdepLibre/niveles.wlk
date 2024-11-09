
class NivelLimitado{
    const limiteDeCarrito
    
 method puedeAgregarProductos(unTamanoDeCarrito) = 
        unTamanoDeCarrito < limiteDeCarrito
}

const bronce = new NivelLimitado(limiteDeCarrito = 1)
const plata = new NivelLimitado(limiteDeCarrito = 5)

object oro  {

    method puedeAgregarProductos(unTamanoDeCarrito) = true
}
