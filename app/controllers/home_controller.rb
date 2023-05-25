class HomeController < ApplicationController
  def index
    if params[:source].blank? && params[:destination].blank?
      @results = Train.all
    else
      @source = params[:source]
      @destination =params[:destination]
      @results = Train.where(["lower(source_station)= ? and lower(destination_station)= ?", "#{@source}".downcase, "#{@destination}".downcase])
    end
  end

  
  
  def search
    if params[:query].blank?
      @results = Train.all
    else
      @parameter = params[:query]
      @results = Train.where("lower(train_name) LIKE :search", search: "%#{@parameter}%")
    end
  end
  

end
