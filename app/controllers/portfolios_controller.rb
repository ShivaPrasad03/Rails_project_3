class PortfoliosController < ApplicationController
    skip_before_action :verify_authenticity_token
    # http_basic_authenticate_with name: "dhh", password: "secret",except: [:index, :show]

    before_action :portfolio_stock, only: %i[show update destroy] 



    def index 
        if params[:investor_id].present? 
            @portfolio_stocks = Portfolio.all.where(investor_id: params[:investor_id])
        else
            @portfolio_stocks = Portfolio.all 
        end
        render json: @portfolio_stocks, status: 200 
    end




    def show  
        if params[:investor_id].present?
            if @portfolio_stock.empty?
                render json: "there is no stock with id #{params[:id]} in this investor portfolio"
            else  
                render json: @portfolio_stock, status: 200 
            end
        else
            render json: @portfolio_stock, status: 200 
        end
    end 





    def create 
        @portfolio_stock = Portfolio.new(portfolio_params)

        @portfolio_stock.investor_id = params[:investor_id]

        if @portfolio_stock.save 
            render json: @portfolio_stock, status: :created 
        else   
            render json: @portfolio_stock.errors
        end
    end 




    def update 
        if params[:investor_id].present?
            if @portfolio_stock.empty?
                render json: "there is no stock with id #{params[:id]} in this investor portfolio"
            else  
                if @portfolio_stock.update(portfolio_params) 
                    render json: @portfolio_stock, status: 200 
                else   
                    render json: @portfolio_stock.errors
                end 
            end
        else
            if @portfolio_stock.update(portfolio_params) 
                render json: @portfolio_stock, status: 200 
            else   
                render json: @portfolio_stock.errors
            end 
        end
        
    end 



    def destroy
        if params[:investor_id].present?
            if @portfolio_stock.empty?
                render json: "there is no stock with id #{params[:id]} in this investor portfolio"
            else  
                @portfolio_stock.destroy
                render json: @portfolio_stock
            end
        else
            @portfolio_stock.destroy
            render json: @portfolio_stock
        end
        
    end



    private 


    def portfolio_params
        params.require(:portfolio).permit(:stock_name, :bought_price, :holding_status, :quantity )
    end

    #filter which executes before actions for show, update and destroy

    def portfolio_stock
            if params[:investor_id].present?
                @portfolio_stock = Portfolio.all.where(investor_id: params[:investor_id],id: params[:id])
            else  
                @portfolio_stock = Portfolio.find(params[:id])
            end
    end
end
