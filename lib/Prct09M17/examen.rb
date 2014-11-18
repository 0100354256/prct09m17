require "Prct09M17/list"
require "Prct09M17/preguntas"

class Examen
  attr_accessor :preguntas

  def initialize (preguntas)
    @preguntas = preguntas
  end

end