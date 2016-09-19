module Api
  module V1
    class ConsolesController < ApplicationController

      def show
        render json: Console.find(params[:id])
      end

      def index
        render json: Console.all
      end

      def create
        @console = Console.new(console_params)
        if @console.save
          render json: @console
        else
          render json: @console.errors, status: 500
        end
      end

      def update
        console = Console.find(params[:id])
        if console.update(console_params)
          render json: console
        else
          render json: console.errors, status: 500
        end

      end

      def destroy
        console = Console.find_by(id: params[:id])
        if console
          console.destroy
          head :ok

        else
          render json: {"error" => "console with id of #{params[:id]} not found"}, status: 404
        end 
      end
      
      private

      def console_params
        params.require(:console).permit(:name,:manufacturer,:release_date)
      end
    end
  end
end
