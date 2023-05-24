ActiveAdmin.register Train do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :train_number, :train_name, :source_station, :destination_station, :arrival_time, :departure_time
  #
  # or
  #
  permit_params do
    permitted = [:train_number, :train_name, :source_station, :destination_station, :arrival_time, :departure_time]
    #permitted << :other if params[:action] == 'create' && current_user.admin?
    permitted
  end

  form do |f|
    f.inputs "Train Details" do
      f.input :train_number
      f.input :train_name
      f.input :source_station, as: :select, collection: Station.pluck(:stn_name)
      f.input :destination_station, as: :select, collection: Station.pluck(:stn_name)
      if f.object.arrival_time.present?
       f.input :arrival_time, as: :string, input_html: {value: f.object.arrival_time.strftime("%I:%M %p"), readonly: true }
      else
       f.input :arrival_time, as: :string,input_html: { placeholder: 'HH:MM' }
      end
      if f.object.departure_time.present?
        f.input :departure_time, as: :string, input_html: {value: f.object.departure_time.strftime("%I:%M %p"), readonly: true }
       else
        f.input :departure_time, as: :string,input_html: { placeholder: 'HH:MM' }
       end
      
    end
    f.actions
  end

  index do
    selectable_column
    id_column
    column :train_number
    column :train_name
    column :source_station
    column :destination_station
    column :arrival_time do |object|
      object.arrival_time.strftime("%H:%M %P")
    end
    column :departure_time
    actions
  end


  
end
