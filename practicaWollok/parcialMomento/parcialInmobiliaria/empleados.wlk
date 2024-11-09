import inmuebles.*
import inmobiliaria.*
class Empleado{
    var dinero
    const reservas = #{}
    const operaciones = #{}

    method operaciones() = operaciones

    method reservar(unaPropiedad,unCliente)
    {
        const reservaDeInmueble = new Reserva(clienteQueReserva = unCliente, propiedadReservada = unaPropiedad)

        unCliente.agregarReserva(reservaDeInmueble)
        self.agregarReserva(reservaDeInmueble)
    }

    method puedeVenderse(unaPropiedad,unCliente) = 
        unaPropiedad.puedeVenderse()&&
        (reservas.isEmpty() ||
        reservas.any({unaReserva => unaReserva.clienteQueReserva() == unCliente && unaReserva.propiedadReservada()==unaPropiedad})
        )
        
    method agregarReserva(unaReserva)
    {
        reservas.add(unaReserva)
    }

    method cobrar(unaCantidad) {
      dinero = dinero + unaCantidad
    }

    method realizarOperacion(unaPropiedad,unCliente)
    {
        if(self.puedeVenderse(unaPropiedad,unCliente))
        {   
            unaPropiedad.realizarOperacion(self)
            operaciones.add(unaPropiedad.operacionPublicada())
        }
        
    }

    method operoEnMismaZonaQue(otroEmpleado)=
        operaciones.any({unaOperacion => otroEmpleado.operoEn(unaOperacion.zonaDeOperacion())})

    method operoEn(unaZona)=
        operaciones.any({unaOperacion => unaOperacion.zonaDeOperacion() == unaZona})

    method hizoOperacionDe(otroEmpleado)=
        operaciones.any({unaOperacion => otroEmpleado.tieneReservada(unaOperacion.inmueble())})

    method tieneReservada(unaPropiedad)=
        reservas.any({unaReserva => unaReserva.propiedadReservada() == unaPropiedad})
}

class Reserva{
    const clienteQueReserva
    const propiedadReservada

    method clienteQueReserva() = clienteQueReserva

    method propiedadReservada() = propiedadReservada
}