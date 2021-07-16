module Api
  module V1
    class LinksController < ApplicationController
      before_action :authenticate_user
      before_action :set_link, only: [:show, :update, :destroy]

      # GET /links
      def index
        @links = Link.all

        render jsonapi: @links
      end

      # GET /links/1
      def show
        render jsonapi: @link
      end

      # POST /links
      def create

        @link = Link.new(link_params)

        if @link.save
          render jsonapi: @link
        else
          render jsonapi_errors: @link.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /links/1
      def update
        if @link.update(link_params)
          render jsonapi: @link
        else
          render jsonapi_errors: @link.errors, status: :unprocessable_entity
        end
      end

      # DELETE /links/1
      def destroy
        @link.destroy
      end

      private
      # Use callbacks to share common setup or constraints between actions.
      def set_link
        @link = Link.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def link_params
        params.require(:link).permit(:url)
      end
    end
  end
end
