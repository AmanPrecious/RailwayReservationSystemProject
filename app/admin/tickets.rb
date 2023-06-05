ActiveAdmin.register Ticket do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :user_id, :train_id, :booking_status, :booking_date, :from_station, :to_station, :class_type, :seat_type, :seat_no, :mobile, :email
  #
  # or
  #
  permit_params do
   permitted = [:user_id, :train_id, :booking_status, :booking_date, :from_station, :to_station, :class_type, :seat_type, :seat_no, :mobile, :email]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
   end
   
  
   form do |f|
    f.inputs "Ticket Details" do

      f.input :train_id
      f.input :booking_status,collection:["Pending","Confirmed","Waiting"]
      f.input :seat_no
      f.input :class_type, as: :select, collection: Seat.distinct.pluck(:class_type)
      f.input :seat_type, as: :select, collection: Seat.distinct.pluck(:seat_type)
  
    end
    f.actions
  end


end
