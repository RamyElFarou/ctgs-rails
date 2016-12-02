class GrantApplicationsController < ApplicationController 
    
    
   
   def new 
       @grant_application = GrantApplication.new 
   end
   
   def create
        @grant_application = GrantApplication.new(grant_application_params)
        
        if @grant_application.save  # only happens if @student passes the validations we set up in our model
            @grant_application.student = Student.find(:student_id)
            flash[:success] = "Congrats"
            redirect_to root_path
        else 
            flash[:error] = "bruh"
        end
   end
 
   
   
   private
   
   # method for whitelisting parameters
   def grant_application_params
       params.require(:grant_application).permit(:student_id)
   end
   
end