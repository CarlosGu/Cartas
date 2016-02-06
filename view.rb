class View

  def show_init
    puts "Bienvenido a Maratón. Te daremos una pregunta y deberás adivinar la respuesta correcta."
    puts "Listo?  Arranca el juego!" 
  end

  def show_question(question)
    puts "\nPregunta"
    puts question
    answer_usu = gets.chomp
    puts " "
    puts "Intento: #{answer_usu}"       
    answer_usu 
  end

  def result(respuesta)
    if respuesta == true
      puts "Correcto!"
    else
      puts "Incorrecto!"
    end
  end

  def final(corrects, incorrects)
    puts "\nAcabaste"
    puts "Tuviste #{corrects} correctas y #{incorrects} incorrectas"
  end

end 