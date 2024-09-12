import ciudades.sprinfield
import ciudades.albuquerque

object region{

    const ciudades = #{sprinfield,albuquerque}

    method centralesMasProductoras() =
        ciudades.map({unaCiudad => unaCiudad.centralMasProductora()}).asSet()
}