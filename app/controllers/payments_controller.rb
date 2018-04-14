class PaymentsController < InheritedResources::Base
  layout "accounts"
  before_action :authenticate_user!
  before_action :set_payment, only: [:show, :edit, :update, :destroy]
  # GET /payments/new
  def index
  @payments = Payment.where(user_id: current_user).payment('created_at DESC')
  end
  def show
  end
  def new
  @payment = current_user.payments.build
  end

  # GET /payments/1/edit
  def edit
  end

  # POST /payments
  # POST /payments.json
  def create
  @payment = current_user.payments.build(payment_params)
   @payment.user_id = current_user.id
  respond_to do |format|
    if @payment.save
      user = User.find_by_id(@payment.user_id)
      payment = @payment
      PaymentMailer.payment_email(user, payment).deliver
      format.html { redirect_to root_path, notice: 'We have received your payment request we will contact you soon.' }
      format.json { render :show, status: :created, location: @payment }
    else
      format.html { render :new }
      format.json { render json: @payment.errors, status: :unprocessable_entity }
    end
  end
  end


    private
    def set_payment
      @payment = Payment.find(params[:id])
    end


    def payment_params
      params.require(:payment).permit(:amount, :first_name, :last_name, :payment_method, :payment_id, :user_id, :email, :order_id)
    end
end
