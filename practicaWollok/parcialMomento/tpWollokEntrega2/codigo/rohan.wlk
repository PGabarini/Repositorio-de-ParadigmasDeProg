import habitantes.*
import zonas.*

const bosqueDeFangorn = new Zona 
  (zonasLimitrofes =#{edoras,estemnet},
    requerimiento = algunGuerreroTieneArmas,
  conseCuenciaDePasar = perderCapaElfica)

const edoras = new Zona 
  (zonasLimitrofes = #{bosqueDeFangorn,estemnet},
    requerimiento = sinRequerimiento,
  conseCuenciaDePasar = ganarUnaBotellaDeVinoCaliente)

const estemnet = new Zona 
  (zonasLimitrofes = #{bosqueDeFangorn,edoras},
    requerimiento = grupoTiene3CapasElficas,
  conseCuenciaDePasar = duplicarVida )

const grupoTiene3CapasElficas = new RequerimientoDeItem (
  itemRequerido = "capa elfica",
  cantidadRequerida = 3
)

const algunGuerreroTieneArmas = new RequerimientoDeGuerrero (
  bloqueDeAtributoRequerido = {guerrero => guerrero.tieneSuficientesArmas(1)}
)

const ganarUnaBotellaDeVinoCaliente = new ConsecuenciaDeItem
  (cantidad = 1 , item = "Botella de vino caliente", consecuencia = ganarItem)

const duplicarVida = new ConsecuenciaDeVida(tipoDeVariacionDeVida = ganarVidaPorcentual, unaCantidad = 2)

const perderCapaElfica = new ConsecuenciaDeItem
  (cantidad = 1 , item = "Capa Elfica", consecuencia = perdidadDeItem)