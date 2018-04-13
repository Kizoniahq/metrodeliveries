class PaymentsController < InheritedResources::Base

  private

    def payment_params
      params.require(:payment).permit(:amount, :first_name, :last_name, :payment_method, :order_id, :user_id, :email)
    end
end

