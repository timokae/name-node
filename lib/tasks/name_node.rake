# frozen_string_literal: true

namespace :name_node do
  desc 'Remove old DataNodes'
  task data_node_cleanup: :environment do
    DataNode.all.each do |node|
      if node.too_old?
        node.delete
      else
        puts "#{node.fingerprint}: #{node.address}"
      end
    end
  end
end
