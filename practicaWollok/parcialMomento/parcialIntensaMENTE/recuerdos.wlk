class Evento
{
    const recuerdoAsociado

    method recuerdoAsociado() = recuerdoAsociado
}
class Recuerdo{
    const fecha
    const descripcion
    const emocionDominanteRecuerdo

    method emocionDominanteRecuerdo()= emocionDominanteRecuerdo

    method esDificilDeExplicar()= descripcion.size() > 10

    method afectar(unaPersona){
        emocionDominanteRecuerdo.asentar(unaPersona,self)
    }
}