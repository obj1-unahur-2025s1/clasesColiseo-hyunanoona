//gladiadores 

class Mirmillones{
  var fuerza 
  var vida = 100
  var armaduraActual 
  const arma = armaFilosa

  method puntosDeArmadura() = armaduraActual.beneficio(self.destreza())

  method destreza() = 15

  method defensa() = self.destreza() + self.puntosDeArmadura() 

  method cambiarArmadura() {armaduraActual = armaduraActual.cambiar()}

  method poderDeAtaque() = fuerza + arma.valorDeAtaque()

  method atacar(unAtacado) {unAtacado.recibirAtaqueYContraatacar(self.poderDeAtaque() - unAtacado.defensa(), self)}

  method recibirAtaqueYContraatacar(unValor, unGladiador) {
    vida = vida - unValor
    self.atacar(unGladiador)
  }
}

class Dimachaerus{
  var vida = 100
  var armas 
  var destreza

  method fuerza() = 10

  method defensa() = destreza*0.5

  method poderDeAtaque() = self.fuerza() + armas.sum{a => a.valorDeAtaque()}

  method atacar(unAtacado) {
    unAtacado.recibirAtaqueYContraatacar(self.poderDeAtaque() - unAtacado.defensa(), self)
    destreza = destreza + 1
  }

  method recibirAtaqueYContraatacar(unValor, unGladiador) {
    vida = vida - unValor
    self.atacar(unGladiador)
  }
}

// armas y armaduras

object armaFilosa{
  var property longitud = 0
  var property filo = 0

  method valorDeAtaque() = longitud*filo

  method asignarFilo(unFilo) {filo = ((unFilo).min(1)).max(0)}
}

object armaContundente {
  var property peso = 0

  method valorDeAtaque() = peso
}

object casco {
  method beneficio(destrezaBase) = 10

  method cambiar() = escudo
}

object escudo{
  method beneficio(destrezaBase) = (destrezaBase*10)/100 + 5

  method cambiar() = casco
}