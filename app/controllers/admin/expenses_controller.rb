class Admin::ExpensesController < ApplicationController
  before_filter :authenticate_user!

  def index
    @expenses = Expense.all
  end

  def show
    @expense = Expense.find(params[:id])
  end

  def new
    @expense = Expense.new
  end

  def create
    @expense = Expense.create(params[:expense])
    @expense.user_id = current_user.id
    if @expense.save
      redirect_to admin_expenses_path
    else
      render :new
    end
  end

  def edit
    @expense = Expense.find(params[:id])
  end

  def update
    @expense = Expense.find(params[:id])
    if @expense.update_attributes(params[:expense])
      redirect_to admin_expenses_path
    else
      render :edit
    end
  end

  def destroy
    @expense = Expense.find(params[:id])
    @expense.destroy
    redirect_to admin_expenses_path
  end
    
end
