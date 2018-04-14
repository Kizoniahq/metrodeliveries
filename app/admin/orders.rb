ActiveAdmin.register Order do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
 permit_params :type, :address, :slug, :city, :state, :country, :paid, :shipment_fee, :weight, :user_id, :delivery_status, :tracking
#
# or
#
form do |f|

    f.inputs do
 f.input :user_id, :label => 'Users', :as => :select, :collection => User.all.map{|u| ["#{u.email}", u.id]}
      f.input :delivery_status
      f.input :paid
    end
      f.submit :submit
    end

# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
def display_name
  self.email
end
controller do
       def find_resource
         scoped_collection.friendly.find(params[:id])
       end
     end
end
