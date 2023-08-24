class SectionsController < ApplicationController
  before_action :authenticate_user!
  def index
    @items = current_user.sections.includes(:payments)
    @total_amount = 0
    @items.each do |item|
      @total_amount += item.payments.sum(:amount)
    end
  end

  def show
    @current_user = current_user
    @section = @current_user.sections.find(params[:id])
    @payments = @section.payments
  end

  def new
    @current_user = current_user
    @section = Section.new
  end

  def create
    @create_section = current_user.sections.build(section_params)
    if @create_section.save
      flash[:notice] = 'You have created new category successfully'
      redirect_to user_sections_path(current_user)
    else
      flash[:alert] = 'Error occured while creating new category '
    end
  end

  private

  def section_params
    params.require(:section).permit(:name, :icon)
  end
end
