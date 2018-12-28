module Api
  module V1
    class ApiNotesController < ApiController
      def index
        notes = Note.all
        json_response(notes)
      end

      def create
        note = Note.new
        note.title = params[:title]
        note.note = params[:note]

        if note.save
          json_response(note, :ok, "Note created.")
        else
          json_response(note, :failed, "Failed to create note.")
        end
      end

      def show
        # Check if note exists
        if not Note.exists?(params[:id])
          return json_response(nil, :failed, "Note not found.")
        end

        # load node
        note = Note.find(params[:id])
        json_response(note)
      end

      def update
        # Check if note exists
        if not Note.exists?(params[:id])
          return json_response(nil, :failed, "Note not found.")
        end

        # load note and update it
        note = Note.find(params[:id])
        note.title = params[:title]
        note.note  = params[:note]

        # save changes
        if note.save
          json_response(note, :ok, "Note updated.")
        else
          json_response(note, :failed, "Could not update note.")
        end
      end

      def delete
        # Check if note exists
        if not Note.exists?(params[:id])
          return json_response(nil, :failed, "Note not found.")
        end

        if Note.delete(params[:id])
          json_response(nil, :ok, "Note deleted.")
        else
          json_response(note, :failed, "Could not delete note.")
        end
      end

      def search
        # prepare search term
        if nil == params[:term]
          return json_response(nil, :failed, "No search term.");
        end
        if params[:term].length < 3
          return json_response(nil, :failed, "Search term to short.")
        end
        searchterm = '%' + params[:term] + '%'

        # search in title and note
        notes = Note.all.where('title LIKE :term OR note LIKE :term', {term: searchterm})
        json_response(notes)
      end

      # helper
      private def json_response(object, status = :ok, message = nil)
        render json: {
                status: status == :ok ? "success" : "failed",
                message: message,
                payload: object},
              status: status
      end
    end
  end
end
