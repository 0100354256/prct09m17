class Preguntas
  attr_accessor :pregunta, :correcta

  include Comparable
    attr :dificultad

  def initialize (dificultad, correcta, pregunta)
    @dificultad = dificultad
    @correcta = correcta
    @pregunta = pregunta
  end

  def obtenerPregunta
    @pregunta
  end

  def obtenerRespuestas
    @respuestas
  end

  def obtenerCorrecta
    correcta
  end

  def <=>(another)
    @dificultad <=> another.dificultad
  end

  def to_s
    "#{@pregunta} #{"\n"} #{@respuestas.join("\n")} #{"\n"}"
 end
end