class GrantApplicationsController < ApplicationController
# => handles the creation of a grant application and corresponding application request
    
    before_action :require_student, only: [:create] 
    
    def new 
       @grant_application = GrantApplication.new 
       @conferences = Conference.all
    end
   
    def create
        
        # Only associate user to grant_application because supervisor
        # should only be accessing the application request
        @grant_application = GrantApplication.new(grant_application_params)
        @grant_application.student = current_user
        
        if GrantApplication.where(:conference_id => @grant_application.conference_id, :student => @grant_application.student).blank? && @grant_application.save
       
        
    
            application_request = ApplicationRequest.create(status: "pending")
            application_request.grant_application = @grant_application
            application_request.student_id = current_user.id
            application_request.supervisor_id = current_user.supervisor_id
            application_request.save!
            flash[:success] = "Congrats, you have created a grant application. 
                                You're current application request status is: 'Incomplete'"
            redirect_to application_request_path(application_request)
            
        else
            
            flash[:danger] = "There was something wrong, grant application was not created"
            redirect_to new_grant_application_path
        end
        
    end

   private
   
   # method for whitelisting parameters
   def grant_application_params
       params.require(:grant_application).permit(:student_id, :conference_id)
   end

end