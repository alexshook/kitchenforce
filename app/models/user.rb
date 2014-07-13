class User < ActiveRecord::Base
  include Restforce

  has_many :searches
  has_many :businesses, through: :search_results

  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.oauth_token = auth.credentials.token
      user.refresh_token = auth.credentials.refresh_token
      user.instance_url = auth.credentials.instance_url
      user.save!
    end
  end

  def make_url
    # instance_url = Restforce::client.instace_url
    # HTTParty.get('https://#{instance_url}')
  end

end
