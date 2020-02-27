# frozen_string_literal: true

class DataHash < ApplicationRecord
  has_many :links
  has_many :data_nodes, through: :links
end
