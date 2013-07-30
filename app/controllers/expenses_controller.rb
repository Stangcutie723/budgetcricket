class ExpensesController < ApplicationController

  before_filter :find_budget
  before_filter :find_expense, :only => [:show, :edit, :update, :destroy]

  def new
    @expense = @budget.expenses.build
  end

  def create
    @expense = @budget.expenses.build(params[:expense])
    if @expense.save
      flash[:notice] = "Expense has been created."
      redirect_to [@budget, @expense]
    else
      flash[:alert] = "Expense has not been created."
      render :action => "new"
    end
  end

  def show
  end

  def edit
  end

  def update
    if @expense.update_attributes(params[:expense])
      flash[:notice] = "Expense has been updated."
      redirect_to budget_expense_path(@expense)
    else
      flash[:alert] = "Expense has not been updated."
      render :action => "edit"
    end
  end

  def destroy
    @expense.destroy
    flash[:notice] = "Expense has been deleted."
    redirect_to @budget
  end

private
  def find_budget
    @budget = Budget.find(params[:budget_id])
  end

  def find_expense
    @expense = @budget.expenses.find(params[:id])
  end
end
