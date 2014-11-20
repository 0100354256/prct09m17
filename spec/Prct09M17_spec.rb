require "Prct09M17"

# ***** Practica 9 *********************************************************************
# **************************************************************************************
describe List do
before :each do
 respuestas1 = ["A", "B", "C", "D"]
 respuestas2 = ["E", "F", "G", "H"]

 @p1 = SeleccionSimple.new(1, 1, "Pregunta 1", respuestas1)
 @p2 = VerdaderoYFalso.new(1, 2, "Pregunta 2")
 @p3 = SeleccionSimple.new(2, 3, "Pregunta 3", respuestas2)

 @n1 = List.new(@p1)
 @n1.add([@p2, @p3])

 @e1 = Examen.new(@n1)
end    

describe "Lista de Preguntas" do
 it "# Pregunta 1" do
   expect(@n1.head[:value].to_s).to eq("Pregunta 1 \n A\n B\n C\n D \n")
 end
 it "# Pregunta 2" do
   expect(@n1.head[:next][:value].to_s).to eq("Pregunta 2 \n V\n F \n")
 end
 it "# Pregunta 3" do
   expect(@n1.head[:next][:next][:value].to_s).to eq("Pregunta 3 \n E\n F\n G\n H \n")
 end
end

describe "Examen" do
 it "# Size" do
   expect(@n1.size()).to eq(3)
 end
 it "# Siguiente pregunta" do
   expect(@e1.siguiente().to_s).to eq("Pregunta 1 \n A\n B\n C\n D \n")
   expect(@e1.siguiente().to_s).to eq("Pregunta 2 \n V\n F \n")
 end
 it "# Respuesta del usuario" do
   expect(@e1.respuesta(1)).to be(true)
   expect(@e1.respuesta(2)).to be(false)
 end
end
end

# ***** Preguntas **********************************************************************
# **************************************************************************************
describe Preguntas do
 before :each do
   respuestas = ["Respuesta 1", "Respuesta 2"]
   @p1 = SeleccionSimple.new(0, 1, "Pregunta 1", respuestas)
 end

 describe "# Pregunta" do
   it "Se almacena correctamente la pregunta" do
     expect(@p1.pregunta).to eq("Pregunta 1")
   end
 end
 
 describe "# Respuestas" do
   it "Se almacena correctamente la respuesta 1" do
     expect(@p1.respuestas[0]).to eq("Respuesta 1")
   end
   it "Se almacena correctamente la respuesta 2" do
     expect(@p1.respuestas[1]).to eq("Respuesta 2")
   end
 end

 describe "# Obtener Pregunta" do
   it "Se obtiene la pregunta 1" do
     expect(@p1.obtenerPregunta).to eq("Pregunta 1")
   end
 end

 describe "# Obtener Respuestas" do
   it "Se obtienen todas las respuestas" do
     respuestas = ["Respuesta 1", "Respuesta 2"]
     expect(@p1.obtenerRespuestas).to eq(respuestas)
   end
 end

 describe "# Imprimir Pregunta y Respuestas" do
   it "Se imprimen la pregunta 1 y todas las respuestas" do
     expect(@p1.to_s).to eq("Pregunta 1 \n Respuesta 1\n Respuesta 2 \n")
   end
 end
end

# ***** Node ***************************************************************************
# **************************************************************************************
describe Node do
  before :each do
   @n1 = Node.new("5", nil)
   @n2 = Node.new("6", @n1)
  end

 describe "Node" do
   it "Debe existir un Nodo de la lista con sus datos y su siguiente" do
    expect(@n2[:value]).to eq("6")
    expect(@n2[:next]).to eq(@n1)
   end
 end
end

# ***** List ***************************************************************************
# **************************************************************************************
describe List do
 before :each do
  @n0 = List.new("0")
  @n0.add (["1", "2", "3", "4", "5"]);
  @n1 = List.new("5")
  @n2 = List.new("10")
  @n3 = List.new("15")

  respuestas1 = ["#<Xyz:0xa000208>", "nil", "0", "Ninguna de las anteriores"]
  respuestas3 = ["1", "bob", "HEY!", "Ninguna de las anteriores"]
  respuestas4 = ["Una instancia de la clase Class", "Una constante", "Un objeto", "Ninguna de las anteriores"]

  @p1 = SeleccionSimple.new(1, 1, "Cual es la salida del siguiente codigo Ruby? \n class Xyz \n def pots \n @nice \n end \n end \n xyz = Xyz.new \n p xyz.pots", respuestas1)
  @p2 = VerdaderoYFalso.new(1, 1, "La siguiente definicion de un hash en Ruby es valida: \n hash_raro = { \n [1, 2, 3] => Object.new(), \n Hash.new => :toto \n }")
  @p3 = SeleccionSimple.new(2, 1, "Cual es la salida del siguiente codigo Ruby?", respuestas3)
  @p4 = SeleccionSimple.new(2, 1, "Cual es el tipo del objeto en el siguiente codigo Ruby? \n class Objeto \n end", respuestas4)
  @p5 = VerdaderoYFalso.new(3, 1, "Es apropiado que una clase Tablero herede de una clase Juego")

  @n4 = List.new(@p1)
  @n4.add ([@p2, @p3, @p4, @p5])
 end    

 describe "List" do
  it "#Se extrae el primer elemento de la lista" do
    @n1.removeFirst
    expect(@n1.head).to eq(nil)
  end

  it "#Se puede insertar un elemento" do
    @n2.add ("20");
    expect(@n2.to_s).to eq("10 -> 20")
  end

  it "#Se pueden insertar varios elementos" do
    @n2.add (["30", "40"]);
    expect(@n2.to_s).to eq("10 -> 30 -> 40")
  end

  it "#Existe lista con su cabeza" do
    expect(@n3.head[:value]).to eq("15")
  end

  it "#Lista doblemente enlazada" do
    expect(@n0.head[:next][:next][:prev][:value]).to eq("1")
  end 
 end

 describe "Lista de Preguntas" do
  it "# Pregunta 1" do
    expect(@n4.head[:value].to_s).to eq("Cual es la salida del siguiente codigo Ruby? \n class Xyz \n def pots \n @nice \n end \n end \n xyz = Xyz.new \n p xyz.pots \n #<Xyz:0xa000208>\n nil\n 0\n Ninguna de las anteriores \n")
  end
  it "# Pregunta 2" do
    expect(@n4.head[:next][:value].to_s).to eq("La siguiente definicion de un hash en Ruby es valida: \n hash_raro = { \n [1, 2, 3] => Object.new(), \n Hash.new => :toto \n } \n V\n F \n")
  end
  it "# Pregunta 3" do
    expect(@n4.head[:next][:next][:value].to_s).to eq("Cual es la salida del siguiente codigo Ruby? \n 1\n bob\n HEY!\n Ninguna de las anteriores \n")
  end
  it "# Pregunta 4" do
    expect(@n4.head[:next][:next][:next][:value].to_s).to eq("Cual es el tipo del objeto en el siguiente codigo Ruby? \n class Objeto \n end \n Una instancia de la clase Class\n Una constante\n Un objeto\n Ninguna de las anteriores \n")
  end
  it "# Pregunta 5" do
    expect(@n4.head[:next][:next][:next][:next][:value].to_s).to eq("Es apropiado que una clase Tablero herede de una clase Juego \n V\n F \n")
  end
 end

 describe "Comparando Preguntas" do
  it "# Mismo grado de dificultad" do
    expect(@p1 == @p2).to be(true)
  end
  it "# Menor grado de dificultad" do
    expect(@p1 < @p3).to be(true)
  end
  it "# Mayor grado de dificultad" do
    expect(@p5 > @p4).to be(true)
  end
  it "# Grado de dificultad entre..." do
    expect(@p3.between?(@p1, @p5)).to be(true)
  end
 end
end