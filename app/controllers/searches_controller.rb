class SearchesController < ApplicationController
  def new
    @search = Search.new
    @categories = Search.categories
  end

  def create
    @search = Search.new search_params
      if @search.save
        @search.distance = 1
        results = @search.get_location(@search.address)
        @search.save_location(results)
        @search.save
        redirect_to @search
      else
        render 'new'
      end
  end

  def show
    @search = Search.find params[:id]
    @results = @search.calculate_results(@search.lat, @search.lng, @search.distance, @search.category)
  end

  private
  def search_params
    params.require(:search).permit(:address, :category)
  end

end
