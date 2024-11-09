import misExcepciones.*

class Grupo{
    const integrantes 

    method podemosEscapar(unaSala)=
        integrantes.any({unaPersona => unaPersona.puedeEscapar(unaSala)})
    
    method escaparDe(unaSala)
    {
        if( self.puedenPagarla(unaSala) )
        {
            const valorDeSalaPorIntegrante = unaSala.valor() /integrantes.size()

            integrantes.forEach({unaPersona => unaPersona.escaparDe(unaSala)})
            integrantes.forEach({unaPersona => unaPersona.pagar(valorDeSalaPorIntegrante)})
            
        }else{throw new NoPodemosPagarLaSala()}
    }

    method puedenPagarla(unaSala) {

        const montoDeGrupo = integrantes.map({unaPersona => unaPersona.saldo()})
        return  montoDeGrupo > unaSala.valor()
    }
           
}