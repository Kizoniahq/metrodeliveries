class AccountsController < ApplicationController
  layout "accounts"
  before_action :authenticate_user!
  before_action :find_users, only: [:index]

  def index
    @users = User.where(user_id: current_user)
    @orders = Order.where(user_id: current_user).order('created_at DESC')
  end
end

private
def find_users
  if params[:id].nil?
    @user = current_user
  end
end
