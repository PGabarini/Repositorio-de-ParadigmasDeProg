import misExcepciones.*
import experiencia.*
class Artista{
    var ahorros
    var cantPeliculasActuadas
    var experiencia

    method cantPeliculasActuadas()= cantPeliculasActuadas

    method nivelDeFama() = cantPeliculasActuadas/2

    method reCategorizarExperiencia()
    {
        try{
            experiencia.puedeSubir(self)
            experiencia = experiencia.nivelMayor()
        } catch unError : NoPuedoSubirMasExcepcion{}
    }

    method sueldo()=
        experiencia.sueldoDeArtista(self)

    method actuar(){
        cantPeliculasActuadas += 1
        ahorros += self.sueldo()
    }
}

