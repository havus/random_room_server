# frozen_string_literal: true

module API
  module V1
    class MessagesController < ApplicationController
      skip_before_action :verify_authenticity_token

      def create
        new_message = Message.new(permitted_params)

        if new_message.save
          RoomChannel.broadcast_to(new_message.room, new_message)

          render json: {}, status: :ok
        else
          render json: { errors: new_message.errors.full_messages }, status: 422
        end
      end

    private
      def permitted_params
        params.require(:message).permit(:user_id, :room_id, :text)
      end
    end
  end
end
