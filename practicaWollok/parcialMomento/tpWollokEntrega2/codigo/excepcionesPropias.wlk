class NoPodemosPasarException inherits Exception(message = "No nos da para pasar por la zona")
{}

class GuerreroCaidoException inherits Exception(message = "Ha muerto el guerrero:  " + guerreroCaido)
{
    const guerreroCaido 

    method guerreroCaido() = guerreroCaido 
}