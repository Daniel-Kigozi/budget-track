class PaymentsController < ApplicationController
  def show
    @current_user = current_user
    @section = @current_user.sections.find(params[:section_id])
    @payments = @section.payments
    @payment = @payments.find(params[:id])
  end

  def new
    @current_user = current_user
    @sections = @current_user.sections
    @section = @current_user.sections.find(params[:section_id])
    @payment = @section.payments.new
  end

  def create
    @current_user = current_user
    @payment_create = @current_user.payments.build(payment_params)
    if @payment_create.save
      @section_payments = SectionPayment.create(section_id: params[:section], payment_id: @payment_create.id)
      redirect_to "/users/#{current_user.id}/sections/"
      flash[:notice] = 'Successfully create'
    else
      flash[:alert] = 'An error occured'
    end
  end

  private

  def payment_params
    params.require(:payment).permit(:name, :amount)
  end
end
