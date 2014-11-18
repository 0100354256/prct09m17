class Preguntas
  attr_accessor :pregunta

  include Comparable
    attr :dificultad

  def initialize (dificultad, pregunta)
    @dificultad = dificultad
    @pregunta = pregunta
  end

  def obtenerPregunta
    @pregunta
  end

  def obtenerRespuestas
    @respuestas
  end

  def <=>(another)
    @dificultad <=> another.dificultad
  end

  def to_s
    "#{@pregunta} #{"\n"} #{@respuestas.join("\n")} #{"\n"}"
 end
end