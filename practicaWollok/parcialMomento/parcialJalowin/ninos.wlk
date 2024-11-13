class Nino
{
    var elementos 
    var actitud
    var caramelos
    var estado = sano
    
    method actitud()=actitud

    method elementos()= elementos

    method caramelos() = caramelos

    method estado(unEstado){
        estado = unEstado
    }
    method capacidadDeAsustar()=
        self.sustoDeElementos() * actitud

    method sustoDeElementos()=
        elementos.sum({unElemento => unElemento.susto()})

    method asustar(unAdulto)
    {
        if(unAdulto.seAsusta(self))
        {
            self.recibirCaramelos(unAdulto.caramelosQueDa())
        }
    }

    method recibirCaramelos(unaCantidad)
    {
        caramelos += unaCantidad
    }

    method tieneCaramelos(unaCantidad)=
        caramelos >= unaCantidad

    method comer(unosCaramelos){
       if(estado.puedeDigerir(unosCaramelos) )
       {
        estado.digerir(unosCaramelos,self)
        caramelos -= unosCaramelos
       }     
    }

    method bajarActitud(unPorcentaje){
        actitud = actitud * unPorcentaje
    }
}

object maquillaje
{
    method susto() = 3
}

class TrajeTierno
{   
    method susto() = 2
}
class TrajeTerrorifico
{
    method susto() = 5
}

class Estado
{
    const estadoSiguiente
    const bajadaDeActitud

    method puedeAsustar()= true
    method puedeDigerir(unosCaramelos) = true

    method digerir(unosCaramelos,unNino)
    {
        if(unosCaramelos > 10)
        {
            unNino.estado(estadoSiguiente)
            unNino.bajarActitud(bajadaDeActitud)
        }
    }
}

const sano = new Estado(estadoSiguiente = empachado, bajadaDeActitud = 0.5)
const empachado = new Estado(estadoSiguiente = enCama, bajadaDeActitud = 0)
object enCama 
{
    method puedeAsustar()= false

    method puedeDigerir(unosCaramelos) = false

    method digerir(unosCaramelos,unNino){}
}
