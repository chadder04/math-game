class Question
  attr_accessor :num1, :num2, :operation

  def initialize
    @num1 = rand(1..20)
    @num2 = rand(1..20)
    @operation = [:+, :-, :/, :*].sample
  end

  def get_question
    "What is the solution to the following problem : #{num1} #{operation} #{num2} = ? "
  end

  def check_answer(answer)
    if answer.to_i == @num1.send(@operation, @num2).to_i
      return true
    else 
      return false
    end
  end
end