class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
    
    protect_from_forgery with: :exception
  
    helper_method :current_user, :logged_in? # now these 2 methods are available in our views 

  # => fetches the current student from the session using the session hash
    def current_user
      @current_student = Student.find(session[:student_id]) if session[:student_id]
      @current_supervisor = Supervisor.find(session[:supervisor_id]) if session[:supervisor_id]
      @current_user = @current_student || @current_supervisor
      
    end
  
    # => Authentication method to ensure that a user is a logged in
    def logged_in?
      !!current_user
    end
  
    
    def require_user
      if !logged_in?
        flash[:danger] = "You must be logged in to perform that action"
        redirect_to root_path
      end
    end

end
  

