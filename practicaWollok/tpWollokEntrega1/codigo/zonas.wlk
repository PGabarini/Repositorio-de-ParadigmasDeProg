import habitantes.gandalf

object lebennin{

    method permitirPasar(habitante) {
        if (self.puedePasar(habitante))
        {habitante.recorrerZona(0)}
    }

    method puedePasar(habitante)= habitante.tienePoderSuficiente(1500)
}

object minasTirith{

    method permitirPasar(habitante){
        if (self.puedePasar(habitante))
        {habitante.recorrerZona(10)}
    }
    
    method puedePasar(habitante) = habitante.tieneArmasSuficientes(1)
}

object lossarnach{

    method permitirPasar(habitante){
        if(self.puedePasar(habitante))
        habitante.recorrerZona(-1)
    }

    method puedePasar(habitante) = true
}

object caminoDeGondor{

    var property zonasDelCamino = [lebennin,minasTirith]

     method permitirPasar(habitante){
        if(self.puedePasar(habitante))
        {zonasDelCamino.forEach({unaZona => unaZona.permitirPasar(habitante)})}
    }

    method puedePasar(habitante) = zonasDelCamino.all({unaZona => unaZona.puedePasar(habitante)})
}