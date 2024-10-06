class Zona {
    const condicionParaPasar // bloque que toma un habitante y vera si puede pasar
    const consecuenciasDePasar // consecuencia numerica sobre la vida de quien atraviese

    method condicionParaPasar() = condicionParaPasar
    method consecuenciasDePasar() = consecuenciasDePasar


    method dejarAtravesar(unHabitante) {
        if (unHabitante.puedeAtravesar(self)) {
            unHabitante.recorrer(consecuenciasDePasar)
        }
    }
}

class Camino {
    var zonasDelRecorrido // set de zonas que componen el camino
    method zonasDelRecorrido(conjuntoDeZonas) {
        zonasDelRecorrido = conjuntoDeZonas
    }

    method dejarAtravesar(habitante) {
        zonasDelRecorrido.forEach({zona => zona.dejarAtravesar(habitante)})
    }
}

const lebennin = new Zona(condicionParaPasar = {habitante => habitante.tieneSuficientePoder(1500)},
                          consecuenciasDePasar = -10)

const minasTirith = new Zona(condicionParaPasar = {habitante => habitante.tieneArmas()},
                             consecuenciasDePasar = 0)

const lossarnach = new Zona(condicionParaPasar = {true},
                            consecuenciasDePasar = 1)

const caminoDeGondor = new Camino(zonasDelRecorrido = [lebennin, minasTirith])