# frozen_string_literal: true

# This model has the following table columns:
# t.string "text"

class Message < ApplicationRecord
  belongs_to :room, class_name: 'Room', foreign_key: :room_id
  belongs_to :user
  
  validates_presence_of :text

  scope :order_from_last, -> { order(id: :desc) }
end
