module Api
  module V1
    class ApiTagsController < ApiController
      def index
        tags = Tag.all
        json_response(tags)
      end

      def create
        tag = Tag.new
        tag.Name = params[:name]

        if tag.save
          json_response(tag, :ok, "Tag created.")
        else
          json_response(tag, :failed, "Failed to create tag.")
        end
      end

      def show
        # Check if tag exists
        if not Tag.exists?(params[:id])
          return json_response(nil, :failed, "Tag not found.")
        end

        # load node
        tag = Tag.find(params[:id])
        json_response(tag)
      end

      def update
        # Check if tag exists
        if not Tag.exists?(params[:id])
          return json_response(nil, :failed, "Tag not found.")
        end

        # load tag and update it
        tag = Tag.find(params[:id])
        tag.Name = params[:name]

        # save changes
        if tag.save
          json_response(tag, :ok, "Tag updated.")
        else
          json_response(tag, :failed, "Could not update tag.")
        end
      end

      def delete
        # Check if tag exists
        if not Tag.exists?(params[:id])
          return json_response(nil, :failed, "Tag not found.")
        end

        if Tag.delete(params[:id])
          json_response(nil, :ok, "Tag deleted.")
        else
          json_response(nil, :failed, "Could not delete tag.")
        end
      end
    end
  end
end
