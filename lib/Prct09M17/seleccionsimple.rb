require "Prct09M17/preguntas"

class SeleccionSimple < Preguntas
  attr_accessor :respuestas

  def initialize (dificultad, correcta, pregunta, respuestas)
    super(dificultad, correcta, pregunta)
    @respuestas = respuestas
  end
end