import castas.*

class Soldado inherits Vikingo{
    var armas

    var asesinatos

    override method esProductivo()=
        asesinatos > 20 &&
        self.tieneArmas()
        
    method tieneArmas() = armas.size() > 0

     override method obtenerAscenso(){
       armas = armas + 10
    }

    override method cobrarVida(){
        asesinatos = asesinatos +1
    }
}

class Granjero inherits Vikingo{
    var hijos

    var hectareas

    override method esProductivo() =  
        (hectareas/2) >= hijos

    override method obtenerAscenso(){
        hijos = hijos + 2
        hectareas = hectareas +2
    }

}

class Vikingo{

   var casta

    var oro

    method obtener(unaCantidadDeOro) {
         oro = oro + unaCantidadDeOro}

   method casta(unaCasta) { casta = unaCasta}

   method esProductivo
   
   method ascenderSocialmente(){
    casta.ascender(self)
   }

   method obtenerAscenso

   method cobrarVida() {}

   method puedeIrAexpedicion() = 
    self.esProductivo() &&
    casta.puedeIrAExpedicion(self)
}