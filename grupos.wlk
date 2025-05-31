class Grupo{
  var nombre
  var gladiadores
  var cantidadDePeleas = 0

  method agregar(unGladiador) {gladiadores.add(unGladiador)}

  method quitar(unGladiador) {gladiadores.remove(unGladiador)}

  method elegirGladiador() = gladiadores.filter{g => g.puedeCombatir()}.max{g => g.poderDeAtaque()}
  
  method recibirCuracion() {gladiadores.forEach{g => g.recibirCuracion()}}

  method atacar(unGladiador) {self.elegirGladiador().atacar(unGladiador)}
}

class Coliseo{
  var gruposYGladiadores 
    
  method efectuarPelea(unGladiadorOGrupo, otroGlaDiadorOGrupo) {
    unGladiadorOGrupo.atacar(otroGlaDiadorOGrupo)
  }

  method curar(unoOVariosGladiadores) {unoOVariosGladiadores.recibirCuracion()}
}
