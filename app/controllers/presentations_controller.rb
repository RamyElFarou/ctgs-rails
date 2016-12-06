class PresentationsController < ApplicationController
    before_action :set_application_request
    before_action :set_presentation, only: [:edit, :update]
    before_action :require_student, only: :new
   
   def new
      @presentation = Presentation.new
   end
   
   def create
      @presentation = Presentation.new(presentation_params)
      @presentation.application_request = ApplicationRequest.find(params[:application_request_id])
      if @presentation.save
            flash[:success] = "You have successfully added a presentation to: " + 
                                "#{@presentation.application_request.grant_application.conference.name}"
            redirect_to application_request_path(@application_request)
      else
           flash[:danger] = "There was an error in adding your presentation, please try again."
           render 'new'
      end
   end
   
   def edit
   
   end
   
    def update
        if @presentation.update(presentation_params)
            flash[:success] = "Presentation was successfully updated" 
            redirect_to application_request_path(@application_request)
        else
            render 'edit'
        end
    end
   
   private
   def presentation_params 
      params.require(:presentation).permit(:topic, :presentation_format, :application_request_id) 
   end
   
   def set_application_request
       @application_request = ApplicationRequest.find(params[:application_request_id])
   end
    
    def set_presentation
       @presentation = Presentation.find(params[:id]) 
    end
    
end