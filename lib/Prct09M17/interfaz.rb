require "Prct09M17/examen"

class Interfaz
  attr_accessor :examen
  def initialize (examen)
    @examen = examen
  end
  
  def responder()
    i = 0
    STDOUT.flush
    while (i < @examen.size())
      puts @examen.siguiente().to_s
      print "Respuesta: "
      comprobar = $stdin.gets.chomp
      if (@examen.respuesta(comprobar))
	puts "\n[ Respuesta Correcta ]\n\n"
      else
	puts "\n[ Respuesta Incorrecta ]\n\n"
      end
      i += 1
    end
  end
  
end