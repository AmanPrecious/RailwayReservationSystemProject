ActiveAdmin.register Payment do
  config.remove_action_item(:new)
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
   permit_params :payment_method, :payment_status, :payment_amount, :ticket_id
  #
  # or
  #
  permit_params do
   permitted = [:payment_method, :payment_status, :payment_amount, :ticket_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
    permitted
  end
  
end
