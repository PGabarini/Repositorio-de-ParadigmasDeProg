object verdulin{
    var cantidadDeCajones = 10
    const pesoCajon = 50 
    var kilometraje = 700000

    method cantidadDeCajones(unaCantidad) {
      cantidadDeCajones = unaCantidad
    }

    method velocidadMaxima() = 80 - self.pesoDeCarga().div(500)

    method pesoDeCarga() = cantidadDeCajones * pesoCajon 

    method recorrer(cantidadRecorrida,velocidadQueIra) {
    kilometraje += cantidadRecorrida
    }
}

object scanion5000 {
    const cantidadDeLiquidos= 5000
    const densidadDelLiquido = 0.2
    
    method velocidadMaxima() = 140 

    method pesoDeCarga() = cantidadDeLiquidos * densidadDelLiquido

    method recorrer(cantidadRecorrida,velocidadQueIra) {
    }
}

object ceralitas {
    var nivelDeDeterioro = 0
    var property pesoDeCarga = 0 

    method hacerViaje() {
        nivelDeDeterioro += 1     
    }
  
    method velocidadMaxima() = if(nivelDeDeterioro<10){40}
                                else{60}
    
    method recorrer(cantidadRecorrida,velocidadQueIra) {
        nivelDeDeterioro += 0.max(velocidadQueIra- 45)
    }
}

object pdpCargas {
    var dinero= 80000

    method cobrarControl(unaCantidad) {
        dinero -= unaCantidad 
    }
}

