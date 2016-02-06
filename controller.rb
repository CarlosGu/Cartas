require_relative 'model'
require_relative 'view'

class Controller
  def initialize
    @view = View.new
    @model = Model.new
    @count = 0
    @corrects = 0
    @incorrects = 0
    @view.show_init
    read
  end

  def read
    array_cards = @model.question_answer
    questions = @model.question(array_cards)
    answers = @model.answer(array_cards)
    answer_user = send_questions(questions, answers)
    comparation(answer_user, answers, questions)
    result(answer_user, answers)
    validate_loop(questions)
  end

  def send_questions(questions, answers)
    answer_user = @view.show_question(questions[@count])
  end

  def comparation(answer_user, answers, questions)
    if answer_user == answers[@count]
      @count += 1
      @corrects += 1
    else
      @count += 1
      @incorrects += 1
    end
  end

  def validate_loop(questions)
    if @count != questions.length 
      read
    else
      final_message
    end
  end

  def result(answer_user, answers)
    if answer_user == answers[@count - 1]
      @view.result(true)
    else
      @view.result(false)
    end
  end  

  def final_message
    @view.final(@corrects, @incorrects) 
  end
end

Controller.new