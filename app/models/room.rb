# frozen_string_literal: true

# This model has the following table columns:
# t.string "name"

class Room < ApplicationRecord
  has_many :messages, class_name: 'Message', foreign_key: :room_id
  
  validates_presence_of :name

  scope :order_from_last, -> { order(id: :desc) }
end
