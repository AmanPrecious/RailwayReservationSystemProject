ActiveAdmin.register Passenger do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :p_name, :p_age, :p_gender, :ticket_id
  #
  # or
  #
  permit_params do
    permitted = [:p_name, :p_age, :p_gender, :ticket_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
   permitted
  end
  
end
