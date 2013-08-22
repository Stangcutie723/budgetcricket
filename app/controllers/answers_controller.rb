class AnswersController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]
  before_filter :find_question
  before_filter :find_answer, :only => [:show, :edit, :update, :destroy]

  def new
    @answer = @question.answers.build
  end

  def create
    @answer = @question.answers.build(params[:answer])
    if @answer.save
      flash[:notice] = "Answer has been created."
      redirect_to @question
    else
      flash[:alert] = "Answer has not been created."
      render :action => "new"
    end
  end

  def show
  end

  def edit
  end

  def update
    if @answer.update_attributes(params[:answer])
      flash[:notice] = "Answer has been updated."
      redirect_to @question
    else
      flash[:alert] = "Answer has not been updated."
      render :action => "edit"
    end
  end

  def destroy
    @answer.destroy
    flash[:notice] = "Answer has been deleted."
    redirect_to @question
  end

private
  def find_question
    @question = Question.find(params[:question_id])
  end

  def find_answer
    @answer = @question.answers.find(params[:id])
  end
end
