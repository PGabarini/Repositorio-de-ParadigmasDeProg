

object emocionAlegre{
    method asentar(unaPersona,unRecuerdo)
    {
        if(unaPersona.tieneFelicidad(500)) 
        {
            unaPersona.agregarPensamientoCentral(unRecuerdo)
        }
    }

    method puedeNegar(unRecuerdo)=
        unRecuerdo.emocionDominanteRecuerdo() != self

}

object emocionTriste{
    method asentar(unaPersona,unRecuerdo)
    {
        unaPersona.agregarPensamientoCentral(unRecuerdo)
        unaPersona.entristecerse(10)
    }

    method puedeNegar(unRecuerdo)=
        unRecuerdo.emocionDominanteRecuerdo() == emocionAlegre
}

class EmocionCompuesta
{
    const emocionesQueLaComponen

    method puedeNegar(unRecuerdo)=
        emocionesQueLaComponen.all({unaEmocion => unaEmocion.puedeNegar(unRecuerdo)})

    method asentar(unaPersona,unRecuerdo)
    {
        emocionesQueLaComponen.forEach({unaEmocion => unaEmocion.asentar(unaPersona,unRecuerdo)})
    }
}