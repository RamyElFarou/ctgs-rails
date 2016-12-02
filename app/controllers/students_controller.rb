class StudentsController < ApplicationController 
   
   def new 
      @student = Student.new 
   end
   
   def create
       @student = Student.new(student_params)
        
        if @student.save  # only happens if @student passes the validations we set up in our model
            flash[:success] = "Congrats"
            redirect_to student_path(@student)
        else 
            flash[:error] = "bruh"
        end
    end
  
   def destroy
       @user = User.find(params[:id])
       user.destroy
       flash[:danger] = "Student and all Grant Applications created by student have been deleted"
       redirect_to users_path
  end
 
   
   # we declare helper_methods under private. 
   # This provides the same functionality as "static" in java (class methods)
   # More specifically, methods above are the public interface of the models for our application
   private
   
   # method for whitelisting parameters
   def student_params
       params.require(:student).permit(:login_id, :password, :student_number)
   end
   
end