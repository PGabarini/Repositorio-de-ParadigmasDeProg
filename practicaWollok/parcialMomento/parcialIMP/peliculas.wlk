class Pelicula{
    const nombre
    const elenco

    method presupuesto()=
        self.sueldoDelElenco() *1.70

    method sueldoDelElenco() = elenco.sum({unArtista => unArtista.sueldo()})
    
    method ganancias() = self.recaudacion() - self.presupuesto()

    method recaudacion() = 1000000 + self.extraSegunTipo()

    method extraSegunTipo()
}

class Drama inherits Pelicula{
    override method extraSegunTipo()=
        100000 * nombre.size()
}

class Acccion inherits Pelicula{
    const vidriosRotos

    override method presupuesto() =
        super() + vidriosRotos *1000

    override method extraSegunTipo()=
        50000 * elenco.size()
}

class Terror inherits Pelicula{
    const cuchos

    override method extraSegunTipo()=
        20000 * cuchos
}

class Comedia inherits Pelicula{

    override method extraSegunTipo() = 0
        
}