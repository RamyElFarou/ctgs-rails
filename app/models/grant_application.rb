class GrantApplication < ActiveRecord::Base
    belongs_to :student # belongs_to will add a foreign key to the declaring model 
    has_one :application_request, dependent: :destroy
    
end
