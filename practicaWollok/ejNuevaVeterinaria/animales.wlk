class Perro inherits Animal{
    const juguetes = []
    
    override method comer(unosGramos) {
        energia += unosGramos / juguetes.size()
    }
    
    override method estaFeliz(){
        return juguetes.contains("pelota")
      }

    override method curar(){
        self.comer(50)
    }

    method perseguirA(unGato){
        energia -= 50
        juguetes.remove(juguetes.first())
        unGato.serPerseguido()
     }


}


class Caballo inherits Animal {

  override method comer(unosGramos) {
    energia += 2 * unosGramos
  }

  method galopar(unaDistancia) {
    energia -= unaDistancia
  }

  override method estaFeliz() = true

  override method curar() {
    self.galopar(3)
		self.comer(3000)
		self.galopar(5)
  }
}

object pegaso inherits Caballo(energia = 100000000000, responsable = "Hércules"){
  var dondeEsta = "Olimpo"

  method volarHacia(unaCiudad) {
      dondeEsta = unaCiudad
      energia /= 2
  }

  override method estaFeliz(){
    return super() && dondeEsta == "Olimpo"
  }

  override method pasarElTiempo(unTiempo){
    self.volarHacia("Olimpo")
  }


}

class Golondrina inherits Animal{ 
    var dondeEsta
  
    method dondeEsta() {
      return dondeEsta
    }
  
    override method comer(unosGramos) {
      energia += unosGramos / 2
    }
  
    method volarHacia(unaCiudad) {
      dondeEsta = unaCiudad
      energia /= 2
    }
  
    override method estaFeliz() {
      return dondeEsta == "Lihuel Calel"
    }
  
    override method curar() {
      self.volarHacia("Lihuel Calel")
    }

    override method pasarElTiempo(unTiempo){
      super(unTiempo*2)
      self.volarHacia("Mar del Plata")
    }
  }


  class Gato inherits Animal{ 
    
    override method comer(unosGramos) {
      energia += unosGramos
    }

    override method estaFeliz() {
      return energia > 30
    }
  
    override method curar() {
          self.comer(400)
      }
      
    method serPerseguido(){
    	energia -= 10
    }
   
  }

  //clase abstracta
  class Animal {
    const responsable
    var energia

    method energia() = energia

    method responsable() = responsable

    method gritoNombreDeResponsable(){
      return responsable.toUpperCase() + "!"
    }

    method comer(unosGramos)

    method pasarElTiempo(unTiempo){
      energia += unTiempo
    }

    method estaFeliz()
    method curar()

  }



//Instancias
const canela = new Perro(energia = 100, responsable = "Lu", juguetes = ["soga","pelota"])
const juana = new Perro(energia = 100, responsable = "Nico", juguetes = ["trapo","pelota","espatula"])
const nano = new Caballo(energia = 100, responsable = "Ro")
const pepita = new Golondrina(energia = 100, responsable = "Gus", dondeEsta = "General las Heras")
const kali = new Gato(energia = 100, responsable = "Dani")