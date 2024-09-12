
import camiones.pdpCargas
object rutatlantica{

    
    method dejarPasar(camionQuePasa){
        pdpCargas.cobrarControl(self.cantidadACobrar(camionQuePasa))
        camionQuePasa.recorrer(400,self.velocidadQuePasara(camionQuePasa))
    }
    
    method cantidadACobrar(camionQuePasa) = 7000+ 100*(camionQuePasa.pesoDeCarga() .div(1000))

    method velocidadQuePasara(camionQuePasa) = camionQuePasa.velocidadMaxima().min(75)
}