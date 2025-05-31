import grupos.*

//gladiadores 

class Mirmillones{
  var fuerza 
  var vida = 100
  var armaduraActual 
  const arma = armaFilosa

  method vida() = vida

  method recibirCuracion() {vida = 100}

  method puedeCombatir() = vida > 1
  
  method fuerza() = fuerza

  method destreza() = 15

  method puntosDeArmadura() = armaduraActual.beneficio(self.destreza())

  method defensa() = self.destreza() + self.puntosDeArmadura() 

  method cambiarArmadura() {armaduraActual = armaduraActual.cambiar()}

  method poderDeAtaque() = fuerza + arma.valorDeAtaque()

  method atacar(unAtacado) {unAtacado.recibirAtaqueYContraatacar(self.poderDeAtaque() - unAtacado.defensa(), self)}

  method recibirAtaqueYContraatacar(unValor, unGladiador) {
    vida = vida - unValor
    if (self.puedeCombatir()) self.atacar(unGladiador)
  }

  method crearGrupo(unGladiador){new Grupo(nombre = "mirmillolandia", gladiadores = [self, unGladiador])}
}

class Dimachaerus{
  var property vida = 100
  var armas 
  var destreza
  
  method recibirCuracion() {self.vida(100)}

  method puedeCombatir() = vida > 1

  method fuerza() = 10

  method defensa() = destreza*0.5

  method poderDeAtaque() = self.fuerza() + armas.sum{a => a.valorDeAtaque()}

  method atacar(unAtacado) {
    unAtacado.recibirAtaqueYContraatacar(self.poderDeAtaque() - unAtacado.defensa(), self)
    destreza = destreza + 1
  }

  method recibirAtaqueYContraatacar(unValor, unGladiador) {
    vida = vida - unValor
    if (self.puedeCombatir()) self.atacar(unGladiador)
  }

  method crearGrupo(unGladiador) {new Grupo(nombre = self.generarNombreGrupo(unGladiador), gladiadores = [self, unGladiador])}

  method generarNombreGrupo(unGladiador){
    const sumaPoderes = self.poderDeAtaque() + unGladiador.poderDeAtaque()
      
    return "D -" + sumaPoderes.toString()
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