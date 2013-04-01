class Admin::IncomesController < ApplicationController
  before_filter :authenticate_user!

  def index
    @incomes = Income.all
  end

  def show
    @income = Income.find(params[:id])
  end

  def new
    @income = Income.new
  end

  def create
    @income = Income.create(params[:income])
    @income.user_id = current_user.id
    if @income.save
      redirect_to admin_incomes_path
    else
      render :new
    end
  end

  def edit
    @income = Income.find(params[:id])
  end

  def update
    @income = Income.find(params[:id])
    if @income.update_attributes(params[:income])
      redirect_to admin_incomes_path
    else
      render :edit
    end
  end

  def destroy
    @income = Income.find(params[:id])
    @income.destroy
    redirect_to admin_incomes_path
  end
    
end
