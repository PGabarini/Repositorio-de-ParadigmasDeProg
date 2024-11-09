import inmobiliaria.*

class Inmueble{
   
    
    const operacionPublicada
    var property zonaUbicada

    method puedeVenderse() = true

    method operacionPublicada() = operacionPublicada
    
    method realizarOperacion(unEmpleado)
    {
        operacionPublicada.pagarComision(unEmpleado)
    }
    
    

    method zonaUbicada() = zonaUbicada

    method valor
}

class Casa inherits Inmueble{
    const valorDeCasa

    override method valor() = valorDeCasa * zonaUbicada.plus()
}

class Ph inherits Inmueble{
     const tamano
    override method valor() = 14000*tamano.min(500000) * zonaUbicada.plus()
}

class Departamento inherits Inmueble{
    const cantidadAmbientes
    override method valor() = 350000 * cantidadAmbientes * zonaUbicada.plus()
}

class Local inherits Casa{

    const tipoDeLocal 

    override method valor() = tipoDeLocal.valorSegunTipo(super())
    override method puedeVenderse() =  false
}

object localALacalle{

    const montoFijo = 100
    method montoFijo()= montoFijo

    method valorSegunTipo(valorBase) = valorBase + montoFijo
}

object galpon{

    method valorSegunTipo(valorBase) = valorBase / 2
}