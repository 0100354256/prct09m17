require "Prct09M17"

# ***** List ***************************************************************************
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
 end    

 describe "Lista de Preguntas" do
  it "# Pregunta 1" do
    expect(@n1.head[:value].to_s).to eq("Pregunta 1 \n A\nB\nC\nD \n")
  end
  it "# Pregunta 2" do
    expect(@n1.head[:next][:value].to_s).to eq("Pregunta 2 \n V\nF \n")
  end
  it "# Pregunta 3" do
    expect(@n1.head[:next][:next][:value].to_s).to eq("Pregunta 3 \n E\nF\nG\nH \n")
  end
  it "# Size" do
    expect(@n1.size()).to eq(3)
  end
 end
end