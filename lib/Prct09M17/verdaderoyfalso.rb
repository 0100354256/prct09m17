require "Prct09M17/preguntas"

class VerdaderoYFalso < Preguntas
  attr_accessor :respuestas

  def initialize (dificultad, correcta, pregunta)
    super(dificultad, correcta, pregunta)
    @respuestas = ["V", "F"]
  end
end