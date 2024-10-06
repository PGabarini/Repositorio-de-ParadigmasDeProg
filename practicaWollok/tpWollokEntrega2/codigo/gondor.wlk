import zonas.*

const lebennin = new Zona(  condicionParaPasar = {unGuerrero => unGuerrero.tieneSuficientePoder(1500)},                         
                            requerimientoDeGuerrero = {unGuerrero => unGuerrero.tieneSuficientePoder(1500)}                          
                            )   

const minasTirith = new Zona(condicionParaPasar = {unGuerrero => unGuerrero.tieneArmas()},                            
                            requerimientoDeCantidadDeItem =10,
                            requerimientoDeItem = "Lembas"
                            )   

const caminoDeGondor = new Camino(zonasDelRecorrido = [lebennin, minasTirith])