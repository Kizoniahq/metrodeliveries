class OrdersController < InheritedResources::Base
layout "accounts"
before_action :authenticate_user!

before_action :set_order, only: [:show, :edit, :update, :destroy]
# GET /orders/new
def index
@orders = Order.where(user_id: current_user).order('created_at DESC')

end
def show
end
def new
@order = current_user.orders.build
end

# GET /orders/1/edit
def edit
end

# POST /orders
# POST /orders.json
def create
@order = current_user.orders.build(order_params)

respond_to do |format|
  if @order.save
    user = User.find_by_id(@order.user_id)
    order = @order
    OrderMailer.order_email(user, order).deliver
    format.html { redirect_to new_payment_path, notice: 'order was successfully created.' }
    format.json { render :show, status: :created, location: @order }
  else
    format.html { render :new }
    format.json { render json: @order.errors, status: :unprocessable_entity }
  end
end
end


  private
  def set_order
    @order = Order.friendly.find(params[:id])
  end
    def order_params
      params.require(:order).permit(:method, :address, :city, :state, :country, :paid, :shipment_fee, :weight, :user_id, :delivery_status, :tracking, :first_name, :last_name, :phone, :email)
    end

end
