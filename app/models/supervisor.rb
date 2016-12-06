class Supervisor < ActiveRecord::Base
    
    # associations
    has_many :students
    
    
    # validations
    has_secure_password
    validates :employee_number, presence: true,
             uniqueness: { case_sensitive: false },
             length: {minimum: 3, maximum: 17}
             
    validates :login_id, presence: true, uniqueness: { case_sensitive: false }
end
