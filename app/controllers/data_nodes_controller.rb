# frozen_string_literal: true

class DataNodesController < ApplicationController
  def handle_heartbeat
    node_params = data_node_params
    hashes_params = hashes_params

    data_node_attrs = node_params.merge(last_heartbeat: DateTime.now)
    DataNode
      .find_or_initialize_by(fingerprint: data_node_attrs[:fingerprint])
      .update_attributes!(data_node_attrs)
    node = DataNode.find_by(fingerprint: data_node_attrs[:fingerprint])

    links_without_me = Link.where.not(data_node_id: node.id)
    map = []
    links_without_me.each do |link|
      next unless map[link.data_hash_id].nil?

      map.push(
        hash: link.data_hash.value,
        addr: link.data_node.address
      )
    end

    params[:hashes].each do |hash|
      hash = hash.to_s
      next if node.data_hashes.where(value: hash).exists?

      data_hash = DataHash.find_by(value: hash)
      if data_hash.nil?
        node.data_hashes.create(value: hash)
      else
        Link.create(data_node: node, data_hash: data_hash)
      end
    end

    response = { status: 'success', foreign_hashes: map }
    render json: response, status: :ok
  end

  def all
    data_nodes =
      if params[:fingerprint]
        DataNode.where('fingerprint != ?', params[:fingerprint])
      else
        DataNode.all
      end

    render json: prepare(data_nodes), status: :ok
  end

  private

  def data_node_params
    params.require(:node).permit(:address, :fingerprint)
  end

  def hashes_params
    params.permit(hashes: [])
  end

  def prepare(nodes)
    nodes.map { |d| { address: d.address, fingerprint: d.fingerprint } }
  end
end
