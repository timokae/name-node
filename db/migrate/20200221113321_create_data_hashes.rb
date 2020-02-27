# frozen_string_literal: true

class CreateDataHashes < ActiveRecord::Migration[5.1]
  def change
    create_table :data_hashes do |t|
      t.string :value
      t.timestamps
    end
  end
end
