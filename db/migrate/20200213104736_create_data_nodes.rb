# frozen_string_literal: true

class CreateDataNodes < ActiveRecord::Migration[5.1]
  def change
    create_table :data_nodes do |t|
      t.string :address
      t.string :fingerprint
      t.datetime :last_heartbeat

      t.timestamps
    end
  end
end
