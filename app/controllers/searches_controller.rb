class SearchesController < ApplicationController
  def new
    @search = Search.new
  end

  def create
    @search = Search.new search_params
      if @search.save
        results = @search.get_location(@search.address)
        @search.save_location(results)
        # TODO double check that params[:type] is going to work
        @type = params[:type]
        @search.save
        redirect_to @search
      else
        render 'new'
      end
  end

  def show
    @search = Search.find params[:id]
    @results = @search.calculate_results(@search.lat, @search.lng, @search.distance)
  end

  private
  def search_params
    params.require(:search).permit(:address, :lat, :lng, :distance)
  end

end
