class Business < ActiveRecord::Base
  has_many :users, through: :search_results
  has_many :specials
end
