require "Prct09M17/preguntas"

class SeleccionSimple < Preguntas
  attr_accessor :respuestas

  def initialize (dificultad, pregunta, respuestas)
    super(dificultad, pregunta)
    @respuestas = respuestas
  end
end