require "Prct09M17/list"
require "Prct09M17/preguntas"

class Examen
  attr_accessor :preguntas, :tam

  @index
  @actual

  def initialize(preguntas)
    @preguntas = preguntas.head
    @actual = @preguntas
    @index = 0
    @tam = preguntas.size
  end

  def siguiente()
    @actual = @preguntas
    if (@index < @preguntas.size())
      @preguntas = @preguntas[:next]
    end

    return @actual[:value]
  end

  def respuesta(r)
    r = r.to_i
    if (r == @actual[:value].obtenerCorrecta())
      return true
    else
      return false
    end
  end
  
  def size()
    return tam
  end
end