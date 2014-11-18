require "Prct09M17/preguntas"

class VerdaderoYFalso < Preguntas
  attr_accessor :respuestas

  def initialize (dificultad, pregunta)
    super(dificultad, pregunta)
    @respuestas = ["V", "F"]
  end
end