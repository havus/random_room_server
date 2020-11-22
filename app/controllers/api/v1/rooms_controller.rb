# frozen_string_literal: true

module API
  module V1
    class RoomsController < BaseController
      skip_before_action :verify_authenticity_token

      def index
        render status: :ok, json: resource_serializer.new(Room.all.order_from_last)
      end

      def show
        chat_room = Room.first
        render json: chat_room, include: [:messages]
      end

      def create
        new_room = Room.new(permitted_params)

        if new_room.save
          ActionCable.server.broadcast(
            'all_room_channel',
            resource_serializer.new(new_room)
          )

          render json: {}, status: :ok
        else
          render json: { errors: new_room.errors.full_messages }, status: 422
        end
      end

    private
      def permitted_params
        params.require(:room).permit(:name)
      end
    end
  end
end
