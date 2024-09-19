
import armas.baculo
import armas.glamdring
object gandalf{

    var property nivelDeVida = 100
    var property armas = #{baculo,glamdring}

    

    method nivelDePoder(){
        if (nivelDeVida > 10){
            return nivelDeVida * 15 + self.sumatoriaDelPoderDeLasArmas() * 2
        } else{
            return nivelDeVida * 300 + self.sumatoriaDelPoderDeLasArmas() * 2
        }
    }

    method sumatoriaDelPoderDeLasArmas() = armas.sum({unArma => unArma.poderOtorgado()})

    method tienePoderSuficiente(unPoder) = self.nivelDePoder() > unPoder

    method tieneArmasSuficientes(unaCantidad) = armas.size() >= unaCantidad

    method recorrerZona(unasConsecuencias){
        nivelDeVida -= unasConsecuencias
    }
}

object tomBombadil{

    method tienePoderSuficiente(unPoder) = true

    method tieneArmasSuficientes(unaCantidad) = true

    method recorrerZona(unasConsecuencias){

    }
}