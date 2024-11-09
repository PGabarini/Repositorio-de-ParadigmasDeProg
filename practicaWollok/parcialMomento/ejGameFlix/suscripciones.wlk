object premium {
  method precio() {
    return 50
  }

  method puedeJugar(unJuego) {
    return true
  }
}

object base {
  method precio() {
    return 25
  }

  method puedeJugar(unJuego) {
    return unJuego.saleMenosQue(30)
  }
}

class SuscripcionPorCategoria {
  const categoria
  const precio

  method precio() {
    return precio
  }

  method puedeJugar(unJuego) {
    return unJuego.perteneceACategoria(categoria)
  }
}

const infantil = new SuscripcionPorCategoria(precio = 10, categoria = "Infantil")
const prueba = new SuscripcionPorCategoria(precio = 0, categoria = "Demo")