class SupervisorsController < ApplicationController
    
    def new
       @supervisor = Supervisor.new 
    end
    
    def create
        @supervisor = Supervisor.new(supervisor_params)
        if @supervisor.save
            flash[:success] = "You have successfully created a supervisor"
            redirect_to root_path
        end
    end
    
    private 
    
    def supervisor_params
       params(:supervsior).permit[:employee_number, :login_id, :password] 
    end
    
end