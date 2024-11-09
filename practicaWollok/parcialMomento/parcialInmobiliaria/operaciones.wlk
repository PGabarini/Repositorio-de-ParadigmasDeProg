class Operacion{
    const inmueble
    method inmueble() = inmueble
    method comision()

   method pagarComision(unEmpleado){
        unEmpleado.cobrar(self.comision())
    }

    method zonaDeOperacion()=
        inmueble.zonaUbicada()
}

class Venta inherits Operacion{
    var porcentajeComision = 1.5

    method porcentajeComision(unPorcentaje) {
        porcentajeComision = unPorcentaje}
    
    override method comision()= 0.015 * inmueble.valor()
    
}

class Alquiler inherits Operacion{
    const mesesAlquiler

    override method comision()=        
        mesesAlquiler * inmueble.valor() / 50000 

    
    
}