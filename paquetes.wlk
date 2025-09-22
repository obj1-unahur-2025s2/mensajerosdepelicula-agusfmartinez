import mensajeros.*
import destinos.*

object paquete {
    var estaPago = false
    var destino = matrix

  method estaPago() {
    return estaPago
  }

  method cambiarDestino(nuevoDestino) {
    destino = nuevoDestino
  }

  method registrarPago() {
    estaPago = true
  }

   method cancelarPago() {
    estaPago = false
  }

  method puedeSerEntregado(mensajero) {
    return estaPago && destino.pasar(mensajero) 
  }

  method precio() = 50

}

object paquetito {
  var destino = matrix

  method estaPago() {
    return true
  }

    method cambiarDestino(nuevoDestino) {
    destino = nuevoDestino
  }

  method puedeSerEntregado(mensajero) {
    return true
  }

  method precio(){
    return 0
  }
}

object paqueton {

    const destinos = []
    var importePagos = 0

  method estaPago() {
    return importePagos == self.precio()
  }

    method agregarDestino(nuevoDestino) {
    destinos.add(nuevoDestino)
  }

  method recibirPago(valor) {
    importePagos = (importePagos + valor).min(self.precio())
  }

  method puedeSerEntregado(mensajero) {
    return destinos.all({d => d.pasar(mensajero)}) and self.estaPago()
  }

  method precio(){
    return destinos.size()*100
  }


}