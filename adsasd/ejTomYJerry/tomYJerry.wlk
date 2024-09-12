
/*En particular, nos interesa saber saber si tom es más veloz que un ratón,
 o sea, si su velocidad es mayor que la velocidad del ratón. Tener en cuenta que

la velocidad de tom se calcula como 5 + (su energía / 10).
la velocidad de jerry se calcula como 10 menos su peso.
la velocidad del robotRaton es siempre de 8 unidades.
tom tiene inicialmente 80 unidades de energía, y jerry, 3 unidades de peso.*/

/*Además, queremos hacer que tom corra a un ratón. Cuando tom corre un ratón:

consume tanta energía como 0.5 * su velocidad * distancia entre ambos, y
su posición actual pasa a ser igual a la del ratón.
tom está inicialmente en la posición 0, jerry en la 10 y el robotRaton en la 12.
*/

object tom {
  var energia = 80
  var posicion = 0

method posicion() = posicion

  method velocidad()= 5+energia.div(10)

  method esMasVelozQue(unRaton) = self.velocidad() > unRaton.velocidad()

  method correrA(unRaton) {
    energia -= 0.5 *  self.velocidad() * self.distanciaA(unRaton)
    posicion = unRaton.posicion()
  }

  method distanciaA(unRaton) = (posicion-unRaton.posicion()).abs()
    
}

object jerry {
    const peso=3
    const posicion = 10

    method velocidad()= 10 - peso
  
    method posicion() = posicion 
}

object robotRaton{
    var property posicion = 12
    
    method velocidad()= 8
}