class AttractionsController < ApplicationController

  before_action :find_attraction, only: [:show, :edit, :update, :destroy, :ride]

  def show
  end

  def index
    @attractions = Attraction.all
  end

  def edit
  end

  def update
    if current_user.admin
      @attraction.update(attraction_params)
      redirect_to attraction_path(@attraction)
    else
      flash[:error] = "You cannot edit an attraction."
      redirect_to attractions_path
    end
  end

  def new
    @attraction = Attraction.new
  end

  def create
    if current_user.admin
      @attraction = Attraction.new(attraction_params)
      if @attraction.save
        redirect_to attraction_path(@attraction)
      else
        render 'new'
      end
    else
      flash[:error] = "You cannot create an attraction."
      redirect_to attractions_path
    end
  end

  def destroy
    # build action
  end

  def ride
    ride = @attraction.rides.build(user: current_user)
    if ride.save
      flash[:message] = ride.take_ride
      redirect_to user_path(current_user)
    else
      flash[:error] = "Something went wrong."
      redirect_to attraction_path(@attraction)
    end
  end

  private

  def find_attraction
    @attraction = Attraction.find(params[:id])
  end

  def attraction_params
    params.require(:attraction).permit(:name, :min_height, :nausea_rating, :happiness_rating, :tickets)
  end

end
