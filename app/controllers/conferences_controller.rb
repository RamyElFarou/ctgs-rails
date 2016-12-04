class ConferencesController < ApplicationController 
    
   def new
       @conference = Conference.new
   end
   
   def create
       @conference = Conference.new(conference_params)
       if @conference.save
           flash[:success] = "You have created a conference"
           redirect_to conferences_path
       else
           flash[:danger] = "Something went wrong with conference creation"
       end
   
   end
   
   def index
      @conferences = Conference.paginate(page: params[:page], per_page: 5) #loads default number of items per page (20)
   end
   
   private 
   
   def conference_params
      params.require(:conferences).permit(:start_date, :end_date) 
   end
   
end