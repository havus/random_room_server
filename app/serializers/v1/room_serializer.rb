# frozen_string_literal: true

module V1
  class RoomSerializer < ApplicationSerializer
    set_type    :room
    set_id      :id
    attributes  :name
  end
end
