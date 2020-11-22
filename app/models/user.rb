# frozen_string_literal: true

# This model has the following table columns:
# t.string "username"
# t.string "display_name"

class User < ApplicationRecord
  validates_presence_of :name
end
