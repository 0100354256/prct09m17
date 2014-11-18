require "Prct09M17"

# - - - List  - - - -
# - - - - - - - - - -
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