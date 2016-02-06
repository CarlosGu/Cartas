require "csv"

class Card
  attr_accessor :question, :answer
  
  def initialize(question, answer)
    @question = question
    @answer = answer
  end

end

class Model

  def question_answer
    array_cards = []
    CSV.foreach("Question.csv") do |row|
      array_cards << Card.new(row[0], row[1])
    end
    array_cards
  end

  def question(array_cards)
    array_questions = []
    array_cards.each do |questions|
      array_questions << questions.question
    end 
    array_questions
  end

  def answer(array_cards)
    array_answers = []
    array_cards.each do |questions|
      array_answers << questions.answer
    end 
    array_answers
  end
end