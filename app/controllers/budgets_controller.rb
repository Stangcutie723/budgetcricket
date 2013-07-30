class BudgetsController < ApplicationController

before_filter :find_budget, :only => [:show, :edit, :update, :destroy]

  def index
    @budgets = Budget.all
  end

  def new
    @budget = Budget.new
  end

  def create
  @budget = Budget.new(params[:budget])
    if @budget.save
      flash[:notice] = "Budget has been created."
      redirect_to @budget
    else
      flash[:alert] = "Budget has not been created."
      render :action => "new"
    end
  end

  def show
  end

  def edit
  end

  def update
    if @budget.update_attributes(params[:budget])
      flash[:notice] = "Budget has been updated."
      redirect_to @budget
    else
      flash[:alert] = "Budget has not been updated."
      render :action => "edit"
    end
  end

  def destroy
    @budget.destroy
    flash[:notice] = "Budget has been deleted."
    redirect_to budgets_path
  end

private

  def find_budget
    @budget = Budget.find(params[:id])
    rescue ActiveRecord::RecordNotFound
    flash[:alert] = "The budget you were looking" +
                    " for could not be found."
    redirect_to budgets_path
  end

end
