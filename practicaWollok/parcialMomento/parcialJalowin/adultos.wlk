class Adulto
{
    var ninosQueLoQuisieronAsustar

    method tolerancia()
    {
        const ninosCon15Caramelos = ninosQueLoQuisieronAsustar.filter({unNino=>unNino.tieneCaramelos(15)})
        return ninosCon15Caramelos.size() * 10
    }
         
    method seAsusta(unNino)
    {
     ninosQueLoQuisieronAsustar.add(unNino)
     return   self.tolerancia() < unNino.capacidadDeAsustar()
    }
    method caramelosQueDa()=
        self.tolerancia() / 2
}

class Abuelo inherits Adulto
{
    override method seAsusta(unNino) = true

    override method caramelosQueDa()= 
        super() /2

}

class Necio inherits Adulto
{
    override method seAsusta(unNino) = false
}
