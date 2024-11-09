class Sala{
    const nombre
    const dificultad
    

    method dificultad() = dificultad

    method esDificil()=
        dificultad > 7

    method valor() = 10000 + self.extraSegunGenero()

    method extraSegunGenero() 
}

class SalaAnime inherits Sala
{
    override method extraSegunGenero() =
        7000
}

class SalaHistoria inherits Sala{
    const esBasada

    override method extraSegunGenero() =
        (10000 * 0.31 ) ** dificultad
    
    override method esDificil()=
     !esBasada
}

class SalaTerror inherits Sala{
    const sustos

    override method extraSegunGenero() =
        if(sustos > 5)
        {
            10000 * 0.2
        }
    
    override method esDificil()=
     super() || sustos > 5
}