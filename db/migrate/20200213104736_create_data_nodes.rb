class CreateDataNodes < ActiveRecord::Migration[5.1]
  def change
    create_table :data_nodes do |t|

      t.timestamps
    end
  end
end
