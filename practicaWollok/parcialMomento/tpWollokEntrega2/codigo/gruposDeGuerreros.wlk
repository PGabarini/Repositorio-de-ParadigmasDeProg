import excepcionesPropias.*
import habitantes.*
class GrupoDeGuerreros
{
    var integrantes =#{}

    method intentarAtravesar(unaZona)
    {
        if(unaZona.puedeSerRecorridoPor(self))
        {
            self.recorrer(unaZona)
        }
        else{ throw new NoPodemosPasarException() }
    }

    method recorrer(unaZona)
    {
         try {
            integrantes.forEach({unGuerrero => unGuerrero.recorrer(unaZona)})
           } catch unError : GuerreroCaidoException {
             integrantes.remove(GuerreroCaidoException.guerreroCaido())
            }
    }
}