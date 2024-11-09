import emociones.*

object rilei{
    var felicidad = 1000
    var emocionDominante = emocionAlegre
    var recuerdosDelDia = []
    var pensamientosCentrales = []
    var recuerdosEnLargoPlazo = []
    var pensamientoActual = "a"

    method felicidad() = felicidad

    method emocionDominante()= emocionDominante

    method emocionDominante(unaEmocion) {
        emocionDominante = unaEmocion
    }

    method vivir(unEvento)
    {
        recuerdosDelDia.add(unEvento.recuerdoAsociado())
    }

    method asentar(unRecuerdo)
    {
        unRecuerdo.afectar(self)
    }

    method conocerRecuerdosRecientes()=
        recuerdosDelDia.take(5)

    method pensamientosCentrales()= pensamientosCentrales.asSet()

    method pensamientosCentralesDificiles()=
        pensamientosCentrales.filter({unRecuerdo => unRecuerdo.esDificilDeExplicar()})

    method agregarPensamientoCentral(unRecuerdo){
        pensamientosCentrales.add(unRecuerdo)
    }

    method tieneFelicidad(unaCantidad)=
        felicidad >= unaCantidad
    
    method entristecerse(unPorcentaje)
    {
        felicidad -= (felicidad *0.1)
    }

    method niega(unRecuerdo)=
        emocionDominante.puedeNegar(unRecuerdo)
    
    method irADormir(palabraClave,unaEmocion)
    {
        self.asentarRecuerdos(recuerdosDelDia)
        self.asentarRecuerdos(self.recuerdosCon(palabraClave))
        self.enviarALargoPlazo(self.recuerdosProfundos())
        self.realizarControlHormonal(unaEmocion)
        self.realizarRestauracionCognitiva()
        recuerdosDelDia.clear()
    }

    method asentarRecuerdos(unosRecuerdos){
        unosRecuerdos.forEach({unRecuerdo => self.asentar(unRecuerdo)})
    }

    method recuerdosCon(palabraClave) =
        recuerdosDelDia.filter({unRecuerdo => unRecuerdo.contiene(palabraClave)})
    
    method recuerdosProfundos()=
        recuerdosDelDia.filter({unRecuerdo => self.esProfundo(unRecuerdo)})

    method esProfundo(unRecuerdo)=
    !(pensamientosCentrales.contains(unRecuerdo) || emocionDominante.puedeNegar(unRecuerdo))

    method enviarALargoPlazo(unosRecuerdos)
    {
        unosRecuerdos.forEach({unRecuerdo => recuerdosEnLargoPlazo.add(unRecuerdo) })
    }

    method realizarRestauracionCognitiva()
    {
        felicidad = 1000.min(felicidad+100)
    }

    method realizarControlHormonal(unaEmocion)
    {
        if(self.pensamientosCentralesDesordenados() || self.fueUnDiaRepetitivo(unaEmocion))
        {
            self.perderElEquilibrio()
        }
    }

    method perderElEquilibrio()
    {
        self.entristecerse(15)
        pensamientosCentrales = pensamientosCentrales.drop(3)
    }

    method pensamientosCentralesDesordenados()=
        pensamientosCentrales.any({unRecuerdo => recuerdosEnLargoPlazo.contains(unRecuerdo)})
    
    method fueUnDiaRepetitivo(unaEmocion)=
        recuerdosDelDia.all({unRecuerdo => unRecuerdo.emocionDominanteRecuerdo() == unaEmocion })
    
    method rememorar()
    {
        pensamientoActual = recuerdosEnLargoPlazo.anyOne()
    }

    method cantRecuerdosRepetidos()
        {   
            const recuerdosRepetidos = recuerdosEnLargoPlazo.filter({unRecuerdo => self.esRepetidoEnLargoPlazo(unRecuerdo)})
            return recuerdosRepetidos.size()
        }

    method esRepetidoEnLargoPlazo(unRecuerdo)=
        recuerdosEnLargoPlazo.count(unRecuerdo) >= 2
    
    method esDejaVu()
    {
        self.esRepetidoEnLargoPlazo(pensamientoActual)
    }
}

