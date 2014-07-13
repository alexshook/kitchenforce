class Search < ActiveRecord::Base
  belongs_to :user

  validates :address, :type, presence: true

  def get_location(address)
    escaped_address = address.downcase.gsub(" ", "+")
    results = HTTParty.get("https://maps.googleapis.com/maps/api/geocode/json?address=#{escaped_address}&sensor=true&key=#{ENV['GOOGLE_GEOCODING_KEY']}")
  end

  def save_location(results)
    self.lat = results['results'][0]['geometry']['location']['lat']
    self.lng = results['results'][0]['geometry']['location']['lng']
  end

  def calculate_results(search_lat, search_lng, distance)
    results = []
    search_lat = self.lat
    search_lng = self.lng

    # Auction.all.each do |auction|
    #   searched_distance = auction.haversine(search_lat, search_lng, auction.lat, auction.lng)
    #   if searched_distance <= distance
    #     results << auction
    #   end
    # end
    # return results
  end

  def get_nearby_businesses
    parameters = { term: params[:term], limit: 40 }
    #TODO fix the search parameters
    results = Yelp.client.search('San Francisco', parameters)

    #TODO check the query string
    business_results = HTTParty.get('http://api.yelp.com/v2/search?term=german+food&location=Hayes&cll=37.77493,-122.419415')

  end

  def haversine(lat1, lng1, lat2, lng2)
    dtor = Math::PI/180
    radius_miles = 3959

    rlat1 = lat1 * dtor
    rlng1 = lng1 * dtor
    rlat2 = lat2 * dtor
    rlng2 = lng2 * dtor

    dlng = rlng1 - rlng2
    dlat = rlat1 - rlat2

    a = (Math::sin(dlat / 2) ** 2) + Math::cos(rlat1) * Math::cos(rlat2) * (Math::sin(dlng / 2) ** 2)
    c = 2 * Math::atan2(Math::sqrt(a), Math::sqrt(1 - a))
    distance = radius_miles * c

    return distance
  end

end




end
