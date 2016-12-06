class ExpenseEstimatesController < ApplicationController
    
    before_action :set_application_request
    before_action :set_expense_estimate, only: [:edit, :update]
    before_action :require_student, only: :new
    
    def new
        @expense_estimate = ExpenseEstimate.new
    end
    
    def create
        @expense_estimate = ExpenseEstimate.new(expense_estimate_params)
        @expense_estimate.application_request = ApplicationRequest.find(params[:application_request_id])
        if @expense_estimate.save
            flash[:success] = "You have saved a valid expense estimate"
            redirect_to application_request_path(@application_request)
        else
            flash[:danger] = "There was an issue with your expense claim"
            render 'new'
        end
    end
    
    def edit
       
    end

    def update
        if @expense_estimate.update(expense_estimate_params)
            flash[:success] = "Expense estimate was successfully updated" 
            redirect_to application_request_path(@application_request)
        else
            render 'edit'
        end
    end
    
    
    
    private
    
    def expense_estimate_params
       params.require(:expense_estimate).permit(:registration, :transportation, :accomodation, :meals, :justification, :application_request_id) 
    end
    
    def set_application_request
       @application_request = ApplicationRequest.find(params[:application_request_id])
    end
    
    def set_expense_estimate
       @expense_estimate = ExpenseEstimate.find(params[:id]) 
    end
    
end
