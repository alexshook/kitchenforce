module Restforce
  def self.request
    return client = Restforce.new  :oauth_token => current_user.oauth_token,
                            :refresh_token => current_user.refresh_token,
                            :instance_url  => current_user.instance_url,
                            :client_id     => ENV['SALESFORCE_KEY'],
                            :client_secret => ENV['SALESFORCE_SECRET']
  end

end
