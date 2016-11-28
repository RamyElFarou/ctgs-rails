class Supervisor < ActiveRecord::Base
    has_many :requesters
end
