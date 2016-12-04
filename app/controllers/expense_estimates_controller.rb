class ExpenseEstimatesController < ApplicationController
    before_action :set_application_request
    
    def new
        @expense_estimate = ExpenseEstimate.new
    end
    
    def create
        @expense_estimate = ExpenseEstimate.new(expense_estimate_params)
        @expense_estimate.application_request = ApplicationRequest.find(params[:application_request_id])
        if @expense_estimate.save
            flash[:success] = "Congrats, you have saved a valid expense estimate"
            redirect_to application_request_path(@application_request)
        else
            flash[:danger] = "There was an issue with your expense claim"
            redirect_to application_request_path(@application_request)
        end
    end
    
    def edit
        
    end

    def update
        
    end
    
    def index
        
    end
    
    private
    
    def expense_estimate_params
       params.require(:expense_estimate).permit(:registration, :transportation, :accomodation, :meals, :application_request_id) 
    end
    
    def set_application_request
       @application_request = ApplicationRequest.find(params[:application_request_id])
    end
    
end
