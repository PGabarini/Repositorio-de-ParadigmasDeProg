object imp{
    const artistas =#{}
    const peliculas = #{}

    method artistaMejorPago() =
        artistas.max({unArtista => unArtista.sueldo()})

    method peliculasEconomicas()=
        peliculas.filter({unaPelicula => unaPelicula.presupuesto() < 500000 })
    
    method gananciaDeLasEconomicas()=
        self.peliculasEconomicas().sum({unaPelicula => unaPelicula.ganancias()})
    
    method recategorizarATodos()
    {
        artistas.forEach({unArtista => unArtista.reCategorizarExperiencia()})
    }
}