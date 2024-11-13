class Banda
{
    const nombre

    method presupuesto() = self.canon() + self.gastoExtraSegunBanda()

    method canon() = 1000000

    method popularidad()

    method gastoExtraSegunBanda()
}

class Rock inherits Banda
{
    const cantidadDeSolosDeGuitarra

    override method gastoExtraSegunBanda() =  10000

    override method popularidad() =
        100 * cantidadDeSolosDeGuitarra
}

class Trap inherits Banda
{
    const tieneHielo

    override method gastoExtraSegunBanda() = 0

    override method popularidad()
    {
        if(tieneHielo)
        {
            return 1000

        }else{return 0}

    }

    override method canon()=
        self.popularidad()  * super()
}

class Indie inherits Banda
{
    const cantidadDeInstrumentos

    override method popularidad()=
        3.14 * nombre.size()

    override method gastoExtraSegunBanda()=
        500 * cantidadDeInstrumentos
}