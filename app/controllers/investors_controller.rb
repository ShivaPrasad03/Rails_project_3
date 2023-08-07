class InvestorsController < ApplicationController

    skip_before_action :verify_authenticity_token

    before_action :investor, only: %i[show update destroy] 

    def index 
        @investors = Investor.all 
        render json: @investors, status: 200 
    end


    def show   
        render json: @investor, status: 200 
    end 



    def create 
        @investor = Investor.new(investor_params)

        if @investor.save 
            render json: @investor, status: :created 
        else   
            render json: @investor.errors
        end
    end 


    def update 
        if @investor.update(investor_params) 
            render json: @investor, status: 200 
        else   
            render json: @investor.errors
        end
    end 



    def destroy
        @investor.destroy

        render json: @investor
    end



    private 


    def investor_params
        params.require(:investor).permit(:name)
    end

    #filter which executes before actions for show, update and destroy

    def investor
        @investor = Investor.find(params[:id])
    end
end
