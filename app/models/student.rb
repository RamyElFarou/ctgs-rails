class Student < ActiveRecord::Base
    
    # associations
    has_many :grant_applications
    has_many :application_requests, through: :grant_applications
    belongs_to :supervisor
    
    # before_save { self.email = email.downcase } #before user hits db, convert email value to lowercase

    # validations
    validates :student_number, presence: true,
             uniqueness: { case_sensitive: false },
             length: {minimum: 2, maximum: 15}
             
    validates :login_id, presence: true, uniqueness: { case_sensitive: false }
    
#    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
#    validates :email, presence: true, length: {maximum: 105},
#            uniqueness: {case_sensitive: false},
#            format: { with: VALID_EMAIL_REGEX }

    has_secure_password
end
