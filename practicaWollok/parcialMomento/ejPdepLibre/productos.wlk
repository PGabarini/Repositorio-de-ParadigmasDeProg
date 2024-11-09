class Producto{
    //const nombre
    const precio
    method precioBase() = precio *1.21
    method precioFinal

    method nombreEnOferta() = "SUPER OFERTA"
}

class Mueble inherits Producto{
    override method precioFinal()= self.precioBase() + 1000
}

class Indumentaria inherits Producto{
    const esDeTemporada
    override method precioFinal()=
        if(esDeTemporada){self.precioBase()*1.1}
        else{self.precioBase()}
    
}

class Ganga inherits Producto{
    override method precioFinal()= 0
    override method nombreEnOferta () = "LLEVAME PORFA " + super()
}