module Api
  module V1

    class VideoGamesController < ApplicationController

      def index
        render json: VideoGame.all
      end

      def show
        vg = VideoGame.find(params[:id])
        render json: vg
      end

      def create
        vg = VideoGame.new(video_game_params)
        if vg.save
          render json: vg
        else
          render json: vg.errors, status: 500
        end
      end

      def update
        vg = VideoGame.find(params[:id])
        if vg.update(video_game_params)
          render json: vg
        else
          render json: vg.errors, status: 500
        end
      end

      def destroy
        vg = VideoGame.find_by(id: params[:id])
        if vg
          vg.destroy
          head :ok
        else
          render json: {"error" => "video game with id of #{params[:id]} not found"}, status: 404
        end
      end

      private

      def video_game_params
        params.require(:video_game).permit(:title, :release_date, :developer, :publisher, :genre, :series, :review_score)
      end


    end

  end
end
