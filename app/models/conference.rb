class Conference < ActiveRecord::Base
    has_many :grant_applications
    
end
