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
}

object escudo{
  method beneficio(destrezaBase) = (destrezaBase*10)/100 + 5
}

class Mirmillones{
  var fuerza 
  var vida = 100
  var armaduraActual 
  const arma = armaFilosa
  const puntosDeArmadura = armaduraActual.beneficio(self.destreza())

  method destreza() = 15

  method defensa() = self.destreza() + puntosDeArmadura 
}