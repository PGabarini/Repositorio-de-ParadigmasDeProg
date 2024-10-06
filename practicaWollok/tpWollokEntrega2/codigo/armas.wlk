
class Baculo {
    const poder
    method poder() = poder
}

class Espada {
    const origen
    const multiplicadorDePoder

    method poder() = multiplicadorDePoder * origen.multiplicadorDeOrigen()

}

class Daga inherits Espada{
    override method poder() = super() / 2
}

class Arco{
    var property tension = 40
    const largo

    method poder() = 0.1 * tension * largo
}

class Hacha{
    const mango
    const pesoDeHoja

    method poder() = mango * pesoDeHoja
}

const glamdring = new Espada (origen = origenElfico,
                              multiplicadorDePoder = 1 )

const baculoDeGandalf =  new Baculo(poder=400)


class Origen{
    const property multiplicadorDeOrigen
}

const origenElfico = new Origen (multiplicadorDeOrigen = 25)

const origenEnano = new Origen (multiplicadorDeOrigen = 20)

const origenHumano = new Origen (multiplicadorDeOrigen = 15)