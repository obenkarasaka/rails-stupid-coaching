# frozen_string_literal: true

##
# The QuestionsController handles question and answer interactions in the application.
#
# This controller provides functionality to:
# * Process questions from users
# * Generate appropriate responses based on the question content
#
# @example
#   GET /questions/ask - Displays the question form
#   GET /questions/answer?question=I am going to work - Returns "Great!"
#
# @note Responses are determined based on three conditions:
#   1. "I am going to work" returns "Great!"
#   2. Questions ending with "?" return "Silly question, get dressed and go to work!"
#   3. All other inputs return "I don't care, get dressed and go to work!"
class QuestionsController < ApplicationController
  def ask; end

  def answer
    @question = params[:question]
    @answer = determine_answer(@question)
  end

  private

  def determine_answer(question)
    return 'Great!' if question == 'I am going to work'

    if question.end_with?('?')
      'Silly question, get dressed and go to work!'
    else
      'I don\'t care, get dressed and go to work!'
    end
  end
end
