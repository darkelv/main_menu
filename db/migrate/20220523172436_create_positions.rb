class CreatePositions < ActiveRecord::Migration[6.0]
  def change
    create_table :positions do |t|
      t.bigint :parent_id
      t.string :name, null: false
      t.integer :kind, null: false, default: 0


      t.timestamps
    end
  end
end
