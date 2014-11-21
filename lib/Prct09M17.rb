require "Prct09M17/version"
require "Prct09M17/seleccionsimple"
require "Prct09M17/verdaderoyfalso"
require "Prct09M17/interfaz"

respuestas1 = ["1. Respuesta Incorrecta", "2. Respuesta Incorrecta", "3. Respuesta Incorrecta", "4. Respuesta Correcta"]
respuestas2 = ["1. Respuesta Incorrecta", "2. Respuesta Incorrecta", "3. Respuesta Correcta", "4. Respuesta Incorrecta"]

@p1 = SeleccionSimple.new(1, 4, "Pregunta 1", respuestas1)
@p2 = VerdaderoYFalso.new(1, 1, "Pregunta 2 [Verdadero]")
@p3 = SeleccionSimple.new(2, 3, "Pregunta 3", respuestas2)
@p4 = VerdaderoYFalso.new(3, 2, "Pregunta 4 [Falso]")
@p5 = VerdaderoYFalso.new(3, 1, "Pregunta 5 [Verdadero]")

@n1 = List.new(@p1)
@n1.add([@p2, @p3, @p4, @p5])

@e1 = Examen.new(@n1)
@i1 = Interfaz.new(@e1)

# @i1.responder()