class ApplicationRequest < ActiveRecord::Base
    belongs_to :grant_application
    has_one :presentation
    has_one :expense_estimate
    
    validates :student_id, :grant_application_id, presence: :true
end
