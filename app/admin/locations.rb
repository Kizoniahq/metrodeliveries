ActiveAdmin.register Location do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :location, :status, :user_id, :order_id
#
# or
form do |f|

    f.inputs do
    f.input :user_id, :label => 'Users', :as => :select, :collection => User.all.map{|u| ["#{u.email}", u.id]}
    f.input :order_id, :label => 'order', :as => :select, :collection => Order.all.map{|u| ["#{u.tracking}", u.id]}

      f.input :location
      f.input :status
    end
      f.submit :submit
    end
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
def display_name
  self.email
end
end
