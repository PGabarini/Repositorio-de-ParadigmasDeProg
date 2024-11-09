class Casta{
    method puedirAExpedicion(unVikingo) = true
    method ascender(unVikingo)

}

class Jarl inherits Casta{

    override method puedirAExpedicion(unVikingo) = not unVikingo.tieneArmas()

    override method ascender(unVikingo)
    {
        unVikingo.casta(Karl)
        unVikingo.obtenerAscenso()
    }
}

class Karl inherits Casta{
    override method ascender(unVikingo)
    {
        unVikingo.casta(Thrall)
        unVikingo.obtenerAscenso()
    }
}

class Thrall inherits Casta{

    override method ascender(unVikingo)
    {       
    }
}