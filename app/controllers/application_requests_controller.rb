class ApplicationRequestsController < ApplicationController
   before_action :require_user
   
 
   def create
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
      @application_request = ApplicationRequest.find(params[:id])
   end
   
   def update
         @application_request = ApplicationRequest.find(params[:id])
      if @application_request.update(application_request_params)
         flash[:success] = "Application request was successfully updated"  #flash notice is printed out via messages partial#
         redirect_to application_requests_path
      else
         render 'edit'
      end
   end
   
   def index
      if session[:student_id]
         @application_requests = current_user.application_requests
      else
         @application_requests = ApplicationRequest.where(:supervisor_id == current_user.id)
      end
   end
   
   

   
   
   # => Class Methods 
   private
   
   def application_request_params
      params.require(:application_request).permit(:status, :student_id, :supervisor_id, :suggested_changes, :advance_requested)
   end
   
   def set_presentation
      
   end
   
   
   

    
end