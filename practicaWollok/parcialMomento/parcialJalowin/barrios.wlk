class Barrio
{
    const ninos

    method los3Mejores()=
        ninos.sortedByDescendente({unNino => unNino.caramelos()}).take(3)
    

    method elementosDeNinoscon10Caramelos()
    {
        const ninosCon10Caramelos = ninos.filter({unNino=>unNino.tieneCaramelos(10)})

        return ninosCon10Caramelos.faltMap({unNino=>unNino.elementos()}).asSet()
    }
}