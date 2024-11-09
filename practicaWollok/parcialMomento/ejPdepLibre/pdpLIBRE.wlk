object pdpLIBRE{
    const usuarios = #{}
    const productos =[]

    method castigarMorosos()
    {
        const morosos = usuarios.filter({usuario => usuario.esMoroso()})
        morosos.forEach({moroso => moroso.bajarPuntos(1000)})
    }

    method eliminarCuponesUsados(){
        usuarios.forEach({usuario => usuario.eliminarCuponesUsados()})
    }

    method obtenerNombresDeProductos(){
       return productos.map({producto => producto.nombreEnOferta()})
    }

    method actualizarNiveles(){
        usuarios.forEach({unUsuario => unUsuario.actualizarNivel()})
    }
}