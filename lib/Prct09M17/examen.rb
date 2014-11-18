require "Prct09M17/list"
require "Prct09M17/preguntas"

class Examen
  attr_accessor :preguntas

  @index
  @actual

  def initialize(preguntas)
    @preguntas = preguntas.head
    @actual = @preguntas
    @index = 0
  end

  def siguiente()
    @actual = @preguntas
    if (@index < @preguntas.size())
      @preguntas = @preguntas[:next]
    end

    return @actual[:value]
  end

  def respuesta(r)
    if (r == @actual[:value].obtenerCorrecta())
      return true
    else
      return false
    end
  end
end