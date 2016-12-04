class ApplicationRequest < ActiveRecord::Base
    belongs_to :grant_application
    has_one :presentation
    has_one :expense_estimate
end
