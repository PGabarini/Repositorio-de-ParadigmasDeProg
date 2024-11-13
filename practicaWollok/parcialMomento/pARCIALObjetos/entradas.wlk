import pdpEnterarinment.*
class Entrada
{   
    const bandaQueToca
    const fechaDeShow

    method bandaQueToca()= bandaQueToca

    method fechaDeShow() = fechaDeShow

    method precio() = 1000 + pdpEntertainment.impuestoPropio()

     method fueShowElAnoPasado(){
        const diaDeHoy = calendar.today()
        return fechaDeShow.year()  == diaDeHoy.year()-1
    }
}