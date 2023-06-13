ActiveAdmin.register Seat do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :class_type, :seat_type, :seat_quantity, :seat_status, :train_id
  #
  # or
  #
  permit_params do
    permitted = [:class_type, :seat_type, :seat_quantity, :seat_status, :train_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
   permitted
  end
  
  form do |f|
    f.inputs "Seat Details" do
      #f.input :train_id, as: :select, collection: Train.pluck(:train_name)
      #f.hidden_field :train_id, value: Train.find_by(train_name:"Humsafer Express").id
      #f.input :train,collection: Train.all.map { |t| [t.train_name]}
      f.input :train_id
      f.input :class_type, as: :select, collection: Seat.distinct.pluck(:class_type)
      f.input :seat_type, as: :select, collection: Seat.distinct.pluck(:seat_type)
      f.input :seat_quantity
  
    end
    f.actions
  end

 

  index do
    selectable_column
    id_column
    column :train_id
    column :class_type
    column :seat_type
    column :seat_quantity
    actions
  end



end
