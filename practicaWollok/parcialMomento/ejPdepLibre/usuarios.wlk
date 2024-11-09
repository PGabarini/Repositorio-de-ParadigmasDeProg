import excepcionesPropias.*
import niveles.*
 
class Usuario{ 

    //const nombre
    var puntos
    var nivel
    var dinero
    const cupones
    const productosEnCarrito


    method agregarAlCarrito(unProducto){
        if(nivel.puedeAgregar(productosEnCarrito.size()))
        {
            productosEnCarrito.add(unProducto)
        }else{ throw new NoTengoNivelSuficienteException()}
    }

    method actualizarNivel()
    {
        nivel =  self.nivelDeAscenso()
    }

    method nivelDeAscenso(){

        if (puntos >=15000) return oro

        if(puntos >=5000) return plata

        return bronce
    }

    method comprarLosProductos(){

        const cuponNoUsado = cupones.filter({unCupon => !unCupon.fueUsado()}).anyOne()
        
        cuponNoUsado.serUsado()

        const precioAPagar = self.precioDelCarrito() * (1-cuponNoUsado.porcentajeDescuento())

        dinero -= precioAPagar

        self.sumarPuntos(precioAPagar)
    }

    method precioDelCarrito() = productosEnCarrito.sum({unProducto => unProducto.precioFinal()})

    method sumarPuntos(unPago)
    {
        puntos = puntos +(unPago * 0.9)
    }

    method esMoroso() = dinero < 0
    
    method eliminarCuponesUsados()
    {
        cupones.removeAllSuchThat({unCupon => unCupon.fueUsado()})
    }

    method bajarPuntos(unaCantidad) {puntos -= unaCantidad}
}