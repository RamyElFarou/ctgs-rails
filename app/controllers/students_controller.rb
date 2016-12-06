class StudentsController < ApplicationController 
   before_action :require_supervisor
   
   def new 
      @student = Student.new 
   end
   
   def create
        @student = Student.new(student_params)
        @student.supervisor = current_user
        if @student.save  # only happens if @student passes the validations we set up in our model
            flash[:success] = "Congratulations the Student was created."
            redirect_to root_path
        else 
            render 'new'
        end
   end
 
   
   # we declare helper_methods under private. 
   # This provides the same functionality as "static" in java (class methods)
   # More specifically, methods above are the public interface of the models for our application
   private
   
   # method for whitelisting parameters
   def student_params
       params.require(:student).permit(:login_id, :password, :student_number, :supervisor_id, :first_name, :last_name)
   end
   
end