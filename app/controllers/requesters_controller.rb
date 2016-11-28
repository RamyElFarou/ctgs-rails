class RequestersController < ApplicationController 
   
   def new 
      @requester = Requester.new 
   end
   
   def create
       @requester = Requester.new(requester_params)
        
        if @requester.save  # only happens if @requester passes the validations we set up in our model
            flash[:success] = "Congrats"
            redirect_to root_path
        else 
            flash[:error] = "bruh"
        end
       
   end
 
   
   # we declare helper_methods under private. 
   # This provides the same functionality as "static" in java (class methods)
   private
   
   # method for whitelisting parameters
   def requester_params
       params.require(:requester).permit(:supervisor_id, :student_id)
   end
   
end