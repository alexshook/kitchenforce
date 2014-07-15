module SearchHelper
  def readable_address(business)
    business.location.address.to_s.gsub('["', "").gsub('"]', "")
  end

end
