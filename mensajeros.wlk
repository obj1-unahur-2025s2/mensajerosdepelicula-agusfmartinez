
object roberto {

    var vehiculo = bicicleta
  
  method peso() {
    return 90 + vehiculo.peso() 
  }

  method cambiarVehiculo(nuevo) {
    vehiculo = nuevo
  }

   method puedeLlamar() {
    return false
  }

}

object chuck {
    method peso() {
      return 80
    }

  method puedeLlamar() {
    return true
  }
}

object neo {
    var creditos = 10

    method peso() {
      return 0
    }

    method puedeLlamar() {
      return creditos > 0
    }

    method cargarCredito(numero) {
      creditos = numero
    }

    method gastarCredito() {
      creditos = 0
    }
  
}

object camion {
    var acoplados = 3
  method peso() {
    return 1.max(acoplados) * 500
  }

  method setAcoplados(nuevo) {
    acoplados = nuevo
  }

}

object bicicleta {
  method peso() {
    return 5
  }

}