class Cliente{

    const reservasPropias = #{}

    method agregarReserva(reservaDeInmueble)
    {
        reservasPropias.add(reservaDeInmueble)
    }

    method pedirReserva(unaPropiedad,unEmpleado)
    {
        unEmpleado.reservar(unaPropiedad,self)
    }

    method pedirConcretarOperacion(unaPropiedad,unEmpleado){
        
            unEmpleado.realizarOperacion(unaPropiedad,self)
            
    }
}