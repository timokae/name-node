# frozen_string_literal: true

class DataNodeCleanupJob < ApplicationJob
  queue_as :default

  def perform(*_args)
    DataNode.delete_all
    DataNode.all.each do |node|
      if node.too_old?
        node.links.delete_all
        node.delete
      end
    end
  end
end
