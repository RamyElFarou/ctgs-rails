class GrantApplication < ActiveRecord::Base
    belongs_to :student # belongs_to will add a foreign key to the declaring model 
    belongs_to :conference
    has_one :application_request, dependent: :destroy
    
    validates :student_id, :conference_id, presence: :true
    
end
