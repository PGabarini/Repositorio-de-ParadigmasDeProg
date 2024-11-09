class Planeta{
    const habitantes

    var construccionesHechas

    method construir(unaConstruccion){
        construccionesHechas.add(unaConstruccion)
    }

    method delegacionDiplomatica(){
        const delegacion = habitantes.map({unHabitante => unHabitante.esDestacado()})
        delegacion.add(self.habitanteMasDestacado())

        return delegacion
    
    }

    method habitanteMasDestacado()=
        habitantes.max({unHabitante => unHabitante.recursos()})

    method esValioso() =
        self.valorDeLasConstrucciones() > 100

    method valorDeLasConstrucciones() = construccionesHechas.sum({unaConstruccion => unaConstruccion.valor()})
}