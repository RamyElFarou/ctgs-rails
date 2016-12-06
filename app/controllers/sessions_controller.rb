class SessionsController < ApplicationController

  # new method is empty -- we only need it as an action for routing (sessions/new) to the login page
  def new 
  
  end 
  

  def create
    
    student = Student.find_by(login_id: params[:session][:login_id])
    if student  && student.authenticate(params[:session][:password])
      session[:student_id] = student.id # => browsers cookies handle this 
      #VICTOR: We can put their names in the flash message once we have added names to Student and Supervisor
      flash[:success] = "Hi " + current_user.first_name + ", You have successfully logged in as a student"
      redirect_to root_path
    
    elsif supervisor = Supervisor.find_by(login_id: params[:session][:login_id]) 
      if supervisor  && supervisor.authenticate(params[:session][:password])
        session[:supervisor_id] = supervisor.id # => browsers cookies handle this
        flash[:success] = "You have successfully logged in as a supervisor"
        redirect_to root_path
      else
        flash.now[:danger] = "Something is wrong with your login information"
        render 'new'
      end
    
    else
       flash.now[:danger] = "Something is wrong with your login information"
       render 'new'
    end
    
  end
  
  
  # end the session and move the user to a logged out state
  def destroy 
    session[:student_id] = nil
    session[:supervisor_id] = nil
    flash[:success] = "You have logged out"
    redirect_to root_path
  end

end