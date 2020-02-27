class CreateLinks < ActiveRecord::Migration[5.1]
  def change
    create_table :links do |t|
      t.references :data_node, foreign_key: true
      t.references :data_hash, foreign_key: true

      t.timestamps
    end
  end
end
