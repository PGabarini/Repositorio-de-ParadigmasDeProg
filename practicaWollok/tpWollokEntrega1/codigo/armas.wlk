object baculo{
   
    method poderOtorgado() = 400

}

class Espada{

    const valorDeOrigen

    method poderOtorgado() = 10 * valorDeOrigen
   
}

const glamdring = new Espada(valorDeOrigen=25)


/*class Espada{
    const origen

    method poderOtorgado() = 10 * self.valorSegunOrigen()
    method valorSegunOrigen() = 
}

const glamdring = new Espada(origen="Elfico")
*/