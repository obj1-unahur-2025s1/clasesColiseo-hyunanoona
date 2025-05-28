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
  method otorga() {}
}