class ApplicationRequestsController < ApplicationController
   
   
 
   def create
      @application_request = ApplicationRequest.new(application_request_params)
      @application_request.student = current_user
      
      if @application_request.save
         flash[:success] = "You have successfully created an application request"
         redirect_to application_request_path(@application_request)
      else
         flash[:danger] = "There was an error, application request was not created"
         redirect_to new_grant_application_path
      end
   end
   
   def show
      @application_request = ApplicationRequest.find(params[:id])
   end
   
   def edit
      
   end
   
   def update
      
   end
   
   # => Class Methods 
   private
   
   def application_request_params
      params.require(:application_request).permit(:status)
   end
   
   def set_presentation
      
   end
   

    
end