//estructura preguntas

struct Question {
    let text: String
    let options: [String]
}

//Array con el listado de las preguntas a mostra al usuario
let questions = [
    Question(text: "¿Qué tipo de poder te gustaría tener?", options: ["Volar", "Super fuerza", "Invisibilidad"]),
    Question(text: "¿Cuál es tu color favorito?", options: ["Rojo", "Azul", "Verde"]),
    Question(text: "¿Cuál sería tu superpoder secundario?", options: ["Telepatía", "Regeneración", "Control mental"]),
    Question(text: "¿Qué tipo de arma prefieres?", options: ["Arco y flecha", "Espada", "Arma de fuego"]),
    Question(text: "¿Cuál es tu motivación principal?", options: ["Justicia", "Venganza", "Poder"])
]


//Cuestonario

func takeQuiz() {
    var answers = [Int]() // Array para almacenar las respuestas del usuario
    
    // Iterar sobre cada pregunta
    for (index, question) in questions.enumerated() {
        print(question.text)
        for (optionIndex, option) in question.options.enumerated() {
            print("\(optionIndex + 1). \(option)")
        }
        
        // Solicitar y validar la respuesta del usuario
        var userAnswer = 0
        repeat {
            if let input = readLine(), let answer = Int(input), answer >= 1 && answer <= question.options.count {
                userAnswer = answer
            } else {
                print("Por favor, introduce un número válido.")
            }
        } while userAnswer == 0
        
        // Almacenar la respuesta del usuario
        answers.append(userAnswer)
        print("\n")
    }
    
}

// Definir la estructura para representar un resultado
struct CharacterResult {
    let name: String
    let description: String
}

// Función para calcular el resultado basado en las respuestas del usuario

func getSuperhero(from answers: [Int]) -> String {
    
    
    // diccionario superheroes
let superheroMap: [String: (answers: [Int], description: String)] = [
    "Superman": ([1, 2, 1, 2, 1], "El último hijo de Krypton, dotado con poderes sobrehumanos."),
    "Batman": ([2, 1, 2, 1, 2], "El caballero oscuro, un vigilante con una mente brillante y una gran fortuna."),
    "Spider-Man": ([1, 2, 1, 2, 1], "Un joven con habilidades arácnidas que lucha contra el crimen."),
    "Wonder Woman": ([2, 1, 2, 1, 2], "Una princesa amazona con fuerza y habilidades sobrehumanas."),
    "Iron Man": ([1, 2, 1, 2, 1], "Un genio multimillonario que utiliza una armadura de alta tecnología para combatir el mal."),
    "Captain America": ([2, 1, 2, 1, 2], "Un supersoldado con una fuerza, agilidad y resistencia mejoradas."),
    "Thor": ([1, 2, 1, 2, 1], "Un dios nórdico del trueno con un martillo mágico llamado Mjolnir."),
    "Hulk": ([2, 1, 2, 1, 2], "Un científico expuesto a radiación gamma que se transforma en una criatura gigante y poderosa cuando se enfurece."),
    "Black Widow": ([1, 2, 1, 2, 1], "Una hábil espía y luchadora, experta en combate cuerpo a cuerpo."),
    "Flash": ([2, 1, 2, 1, 2], "Un héroe con la habilidad de correr a velocidades increíbles."),
    "Green Lantern": ([1, 2, 1, 2, 1], "Un miembro del Cuerpo de Linternas Verdes, con un anillo que le otorga poderes de construcción con la mente."),
    "Aquaman": ([2, 1, 2, 1, 2], "El rey de la Atlántida, con la habilidad de comunicarse y controlar criaturas marinas."),
    "Doctor Strange": ([1, 2, 1, 2, 1], "Un hechicero supremo, maestro de las artes místicas."),
    "Black Panther": ([2, 1, 2, 1, 2], "El rey de Wakanda, con habilidades mejoradas gracias al corazón de vibranium."),
    "Captain Marvel": ([1, 2, 1, 2, 1], "Una piloto de la Fuerza Aérea con poderes cósmicos."),
    "Green Arrow": ([2, 1, 2, 1, 2], "Un arquero experto que lucha por la justicia."),
    "Wolverine": ([1, 2, 1, 2, 1], "Un mutante con garras retráctiles y un factor de curación acelerado."),
    "Ant-Man": ([2, 1, 2, 1, 2], "Un científico que puede encogerse a un tamaño diminuto o aumentar su tamaño."),
    "Vision": ([1, 2, 1, 2, 1], "Un sintezoide con una variedad de poderes, incluida la capacidad de volar y disparar rayos."),
    "Scarlet Witch": ([2, 1, 2, 1, 2], "Una poderosa hechicera con habilidades de manipulación de la realidad.")
]

    
    // Iterar sobre el diccionario para encontrar el superhéroe que coincida con las respuestas
    for (superhero, answersForSuperhero) in superheroMap {
        if answersForSuperhero == answers {
            return superhero
        }
    }
    
    // Si no coincide ninguna respuesta con el diccionario se muestra un mensje predeterminado
    return "No tienes ningun superpoder :'(, intenta nuevamente...."

    
// Mostrar el resultado en pantalla
        let alertController = UIAlertController(title: "Resultado",
                                                message: "Personaje: \(superheroMap.name)\nDescripción: \(superheroMap.description)",
                                                preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            // Reiniciar el cuestionario si se desea
            self.restartQuiz()
        }
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)

}



// Llamar a la función takeQuiz para iniciar el cuestionario
takeQuiz()

// Llamar funcion para mostrar el personaje 
getSuperhero()
