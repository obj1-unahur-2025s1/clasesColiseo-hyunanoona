class ArmaFilosa{
  var filo
  var logitud

  method valorAportado() = filo*logitud

  method initialize(){
    if (not filo.between(0, 1)) self.error(filo + "no es un filo valido")
  }
}
