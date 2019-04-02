class AttractionsController < ApplicationController

   def index
    @attractions = Attraction.all
  end

   def new
    @attraction = Attraction.new
    # @ride = @attraction.rides.build(user_id: current_user.id)
  end

   def show
    @attraction = Attraction.find_by(id: params[:id])
  end

   def create
    @attraction = Attraction.new(attraction_params)
    if @attraction.save
      redirect_to attraction_path(@attraction)
    else
      render :new
    end
  end

   def edit
    @attraction = Attraction.find_by(id: params[:id])
    # @ride = @attraction.rides.build(user_id: current_user.id)
  end

   def update
    @attraction = Attraction.find_by(id: params[:id])
    if @attraction.update(attraction_params)
      redirect_to attraction_path(@attraction)
    else
      render :new
    end
  end

   private

   def attraction_params
    params.require(:attraction).permit(:name, :min_height, :happiness_rating, :nausea_rating, :tickets)
  end
end


# class AttractionsController < ApplicationController
#
#    def new
#     @attraction = Attraction.new
#   end
#
#    def index
#     @attractions = Attraction.all
#   end
#
#    def show
#     @attraction = Attraction.find(params[:id])
#   end
#
#    def edit
#     @attraction = Attraction.find(params[:id])
#   end
#
#    def update
#     @attraction = Attraction.find(params[:id])
#     if @attraction.update(attraction_params)
#         redirect_to attraction_path(@attraction, notice: 'Attraction was successfully updated.')
#     else
#         redirect_to edit_attraction_path(@attraction)
#     end
#   end
#
#    def create
#     @attraction = Attraction.new(attraction_params)
#       if @attraction.save
#           redirect_to attraction_path(@attraction, notice: 'Attraction was successfully created.')
#       else
#           redirect_to new_attraction_path
#       end
#   end
#
#    private
#
#    def attraction_params
#       params.require(:attraction).permit(:name, :tickets, :nausea_rating, :happiness_rating, :min_height)
#   end
#
#  end