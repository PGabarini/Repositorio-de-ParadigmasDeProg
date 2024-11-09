// ZONAS Y CAMINOS

class Zona {
  const zonasLimitrofes

  const requerimiento
  const conseCuenciaDePasar

  method regionQueSoy()
  {

  }

  method limitoCon(unasZonas)
  {
    unasZonas.all({unaZona => self.esLimitrofe(unaZona)})
  }

  method esLimitrofe(unaZona)
  {
    if(unaZona == self)
    {
      return true
    }

    return zonasLimitrofes.contains(unaZona)
  }

  method serRecorridaPor(unGuerrero) 
  {
    conseCuenciaDePasar.afectar(unGuerrero)
  }

  method puedeSerRecorridoPor(grupoDeGuerreros) = requerimiento.evaluar(grupoDeGuerreros)
}

class Camino {
  const zonasDelRecorrido

  method puedeSerRecorridoPor(grupoDeGuerreros) = zonasDelRecorrido.all({zona => zona.puedeSerRecorridoPor(grupoDeGuerreros)})

  method validarCamino()
  {
    zonasDelRecorrido.all({unaZona => unaZona.limitoCon(zonasDelRecorrido)})
  }

  method regionesQuePasas()
  {
    return zonasDelRecorrido.map({unaZona => unaZona.regionQueSoy()}).unique()
  }
}

// REQUERIMIENTOS PARA ATRAVESAR UNA ZONA
class RequerimientoDeItem {
  const itemRequerido
  const cantidadRequerida

  method evaluar(grupoDeGuerreros) = 
    grupoDeGuerreros.sum({guerrero => guerrero.cantidadDe(itemRequerido)}) >= cantidadRequerida
}

class RequerimientoDeGuerrero {
  const bloqueDeAtributoRequerido

  method evaluar(grupoDeGuerreros) = 
    grupoDeGuerreros.any({guerrero => bloqueDeAtributoRequerido.apply(guerrero)})
}

object sinRequerimiento {
  method evaluar(grupoDeGuerreros) = true
}
class ConsecuenciaDeVida {
  const tipoDeVariacionDeVida
  const unaCantidad

  method afectar(unGuerrero){ 
    tipoDeVariacionDeVida.modificarVida(unGuerrero,unaCantidad)
    }
}
object perdidaDeVida
{
  method modificarVida(unGuerrero,unaCantidad)
    {unGuerrero.serDanado(unaCantidad)}
}
object ganarVida
{
  method modificarVida(unGuerrero,unaCantidad)
    {unGuerrero.serCurado(unaCantidad)}
}

object ganarVidaPorcentual
{
  method modificarVida(unGuerrero,unaCantidad)
    {unGuerrero.serCuradoPorcentual(unaCantidad)}
}

class ConsecuenciaDeItem
{
  const cantidad
  const item
  const consecuencia

  method afectar(unGuerrero) {
    cantidad.times(consecuencia.efecto(item,unGuerrero))
  }

}

object perdidadDeItem{

  method efecto(item,unGuerrero) 
     {unGuerrero.eliminarUnItem(item)}
     
}

object ganarItem{

  method efecto(item,unGuerrero)=
     {unGuerrero => unGuerrero.sumarUnItem(item)}
     
}

object sinConsecuencias
{
  method afectar(unGuerrero){}
}
