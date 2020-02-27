# frozen_string_literal: true

class DataNode < ApplicationRecord
  has_many :links, dependent: :delete_all
  has_many :data_hashes, through: :links

  def too_old?
    diff_in_seconds = Time.now - last_heartbeat
    threshold = 1 * 60

    diff_in_seconds > threshold
  end
end
