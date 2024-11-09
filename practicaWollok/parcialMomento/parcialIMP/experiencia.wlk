import parcialIMP.misExcepciones.NoPuedoSubirMasExcepcion

object experienciaAmateur{
    
    method puedeSubir(unArtista)=
        unArtista.cantPeliculasActuadas() >= 10

    method nivelMayor() = experienciaEstablecida
    
    method sueldoDeArtista(unArtista) = 10000

    
}

object experienciaEstablecida{
    
    method puedeSubir(unArtista)=
        unArtista.nivelDeFama() > 10

    method nivelMayor() = experienciaEstrella
    
    method sueldoDeArtista(unArtista){
        if(unArtista.nivelDeFama() >= 15)
        {
            return 50000 * unArtista.nivelDeFama()

        }else{return 15000}
    }

}

object experienciaEstrella{
    
    method puedeSubir(unArtista) = throw new NoPuedoSubirMasExcepcion()
        
    method nivelMayor() = self
    
    method sueldoDeArtista(unArtista) = 30000 * unArtista.cantPeliculasActuadas()

    
}