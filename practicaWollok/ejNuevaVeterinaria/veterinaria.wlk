//HUELLITAS

import animales.*

object huellitas {
  const botiquin = ["Venda", "Venda", "Venda", "Pervinox", "Alcohol", "Gasas"]
  const pacientes = #{nano, pepita, kali, canela, juana}

  method botiquin() = botiquin

  method agregarAlBotiquin(cosaAAgregar) {
    self.agregarA(botiquin, cosaAAgregar)
    // botiquin.add(cosaAAgregar)
    // Sintaxis de envío de mensajes
    // objeto.mensaje(unos, parametros)
    // self.botiquin().add(cosaAAgregar)
  }

  method necesitaComprarVendas() {
    return botiquin.count({ unElemento => unElemento == "Venda" }) < 3
  }

  method pacientes() = pacientes

  method agregarPaciente(unPaciente) {
    pacientes.add(unPaciente)
  }

  method agregarA(coleccion, unValor) {
    coleccion.add(unValor)
  }

  method darDeAlta(unPaciente) {
    pacientes.remove(unPaciente)
  }

  method cantidadDePacientes() {
    return pacientes.size()
  }

  method pacientesRecuperados() {
    return pacientes.filter({ unPaciente => unPaciente.estaFeliz() })
  }

  method responsablesDePacientes() {
    return pacientes.map({ unPaciente => unPaciente.responsable() }).asSet()
  }

  method pacienteMasEnergetico() {
    return pacientes.max({ unPaciente => unPaciente.energia() })
  }

  method curarATodos() {
    pacientes.forEach({ unPaciente => unPaciente.curar() })
  }
}