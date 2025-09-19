import mensajeros.*

object brooklin {
  method pasar(mensajero) {
    return mensajero.peso() <= 1000
  }
}

object matrix {
  method pasar(mensajero) {
    return mensajero.puedeLlamar()
  }
}