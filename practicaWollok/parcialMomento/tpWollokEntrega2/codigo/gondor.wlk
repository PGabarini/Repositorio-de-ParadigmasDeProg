import habitantes.*
import zonas.*
import rohan.*


const belfalas = new Zona 
(zonasLimitrofes = #{lebennin},
  requerimiento = sinRequerimiento,
 conseCuenciaDePasar = perder30prcDeVida)

const lebennin = new Zona 
(zonasLimitrofes = #{minasTirith,belfalas},
  requerimiento = algunGuerreroCon1500DePoder,
 conseCuenciaDePasar = sinConsecuencias)

const minasTirith = new Zona 
( zonasLimitrofes = #{lebennin},
  requerimiento = grupoTiene10Lembas,
 conseCuenciaDePasar = perder15Devida)



const grupoTiene10Lembas = new RequerimientoDeItem (
  itemRequerido = "lemba",
  cantidadRequerida = 10
)

const algunGuerreroCon1500DePoder = new RequerimientoDeGuerrero (
  bloqueDeAtributoRequerido = {guerrero => guerrero.tieneSuficientePoder(1500)}
)

const perder15Devida = new ConsecuenciaDeVida(tipoDeVariacionDeVida = perdidaDeVida, unaCantidad = 15)
const perder30prcDeVida = new ConsecuenciaDeVida (tipoDeVariacionDeVida = ganarVidaPorcentual, unaCantidad = 0.3)