# frozen_string_literal: true

class Link < ApplicationRecord
  belongs_to :data_node
  belongs_to :data_hash
end
