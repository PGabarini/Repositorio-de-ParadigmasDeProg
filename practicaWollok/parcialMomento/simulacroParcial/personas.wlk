class Persona {
    var saldo
    var salasEscapadas
    var maestria

    method saldo() = saldo

    method maestria(unaMaestria) { 
        maestria = unaMaestria}

    method puedeEscapar(unaSala)=    
        maestria.permiteSalir(unaSala,salasEscapadas.size())


    method escaparDe(unaSala){

        salasEscapadas.add(unaSala)
    }

    method pagar(unValor){
        saldo -= unValor
    }

    method salasQueSalio()
    {
        return salasEscapadas.asSet()
    }
    
    method subirDeNivel()
    {
        if(salasEscapadas.size() > 6)
        {
        maestria = maestriaProfesional
        }   
    }
}

object maestriaProfesional
{
    method permiteSalir(unaSala,salasEscapadas)=
        true
}

object maestriaAmateur{

    method permiteSalir(unaSala,salasEscapadas)=
        (!unaSala.esDificil()) and salasEscapadas> 6
}
