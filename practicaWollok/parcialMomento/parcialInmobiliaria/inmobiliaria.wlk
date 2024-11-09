object inmobiliaria{

    const empleados = #{}

    method mejorEmpleado(unCriterio)
    {
        return empleados.max({unEmpleado => unCriterio.comparar(unEmpleado)})
    }

    method tendranProblemas(unEmpleado,otroEmpleado)
    {
        self.realizaronOperacionesEnMismaZona(unEmpleado,otroEmpleado) &&
        self.noFueronLeales(unEmpleado,otroEmpleado)
    }

    method realizaronOperacionesEnMismaZona(unEmpleado,otroEmpleado)=
        unEmpleado.operoEnMismaZonaQue(otroEmpleado)
    
    method noFueronLeales(unEmpleado,otroEmpleado)= 
        unEmpleado.hizoOperacionDe(otroEmpleado)
}