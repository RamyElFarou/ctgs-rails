class GrantApplicationsController < ApplicationController 
    
    
   
   def new 
       @grant_application = GrantApplication.new 
   end
   
   def create
        @grant_application = GrantApplication.new(grant_application_params)
        
        if @grant_application.save 
            @grant_application.student = current_user # if session[:student_id] 
            application_request = ApplicationRequest.create(status: "pending")
            application_request.grant_application = @grant_application
            application_request.save
            flash[:success] = "Congrats, you have created a grant application. 
                                You're current application request status is: 'Incomplete'"
            redirect_to application_request_path(application_request)
        else 
            flash[:danger] = "There was something wrong, grant application was not created"
        end
   end
 
   
   
   private
   
   # method for whitelisting parameters
   def grant_application_params
       params.require(:grant_application).permit(:student_id, :conference_id)
   end

end