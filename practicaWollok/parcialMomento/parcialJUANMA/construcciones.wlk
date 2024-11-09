
class Construccion{
    method valor()
}

class Muralla inherits Construccion{
    const longitud

    override method valor()=
        10 * longitud
}

class Museo inherits Construccion{
    const supCubierta
    const indiceDeImportancia

    override method valor()=
        supCubierta * indiceDeImportancia
}