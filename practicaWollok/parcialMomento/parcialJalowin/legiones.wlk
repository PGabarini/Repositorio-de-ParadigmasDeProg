class Legion
{
    const ninos

    method capacidadDeAsustar()=
        ninos.sum({unNino=>unNino.capacidadDeAsustar()})
    
    method caramelosDeLegion()=
        ninos.sum({unNino=>unNino.caramelos()})
    
    method asustar(unAdulto)
    {   
        if(self.algunoAsusta(unAdulto))
        {
            self.liderDeLaLegion().recibirCaramelos(unAdulto.caramelosQueDa())
        }
    }

    method algunoAsusta(unAdulto)=
        ninos.any({unNino => unAdulto.seAsusta(unNino)})

    method liderDeLaLegion()=
        ninos.max({unNino => unNino.capacidadDeAsustar()})
}