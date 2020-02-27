# frozen_string_literal: true

Rails.application.routes.draw do
  post 'heartbeat', to: 'data_nodes#handle_heartbeat'
  get 'data-nodes', to: 'data_nodes#all'
end
