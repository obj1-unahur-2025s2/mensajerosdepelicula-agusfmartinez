import mensajeros.*
import paquetes.*


object empresa {
  const mensajeros = []
  const paquetesEnviados = []
  const paquetesPendientes = []

  method enviarPaquete(paquete) {
    if (self.algunoPuedeEntregar(paquete)){
        paquetesEnviados.add(paquete)
    }else{
        paquetesPendientes.add(paquete)
    }
  }

  method mensajeros() {
    return mensajeros
  }

  method contratar(mensajero) {
    mensajeros.add(mensajero)
  }

  method despedir(mensajero) {
    mensajeros.remove(mensajero)
  }

  method despedirTodos() {
    mensajeros.clear()
  }

  method esGrande() {
    return mensajeros.size() > 2
  }

  method puedeEntregarElPrimero(paquete) {
    return if(!mensajeros.isEmpty()){
        paquete.puedeSerEntregado(mensajeros.first())
    } else {
      false
    }
  }

  method pesoUltimoMensajero() {
    return mensajeros.last().peso()
  }

  method algunoPuedeEntregar(paquete) {
    return mensajeros.any({m => paquete.puedeSerEntregado(m)})
  }

    // devuelve otra lista, no modifica la original
    method mensajerosPuedenLlevarPaquete(paquete) {
      return mensajeros.filter({m => paquete.puedeSerEntregado(m)})
    }

    // lista.sum() cuando es lista numerica, lista.sum(obj) cuando la lista es de objetos
    method tieneSobrepeso() {
      return mensajeros.sum({m => m.peso()}) / mensajeros.size() > 500
    //   mensajeros.map({m => m.peso()}).sum() / mensajeros.size() > 500
    }

    method facturacion() {
      return paquetesEnviados.sum({p => p.precio()})
    }

    method enviarPaquetes(conjPaquetes) {
      conjPaquetes.forEach({p => self.enviarPaquete(p)})
    }

    method enviarPendienteMasCaro() {
        const elMasCaro = self.paquetePendienteMasCaro()

        if(self.algunoPuedeEntregar(elMasCaro)){
            self.enviarPaquete(elMasCaro)
            paquetesPendientes.remove(elMasCaro)
        }
    }

    method paquetePendienteMasCaro() {
      return paquetesPendientes.max({p => p.precio()})
    }

    method paquetesEnviados() {
      return paquetesEnviados
    }

     method paquetesPendientes() {
      return paquetesPendientes
    }

}