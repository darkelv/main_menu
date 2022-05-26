class KindToString < ActiveRecord::Migration[6.0]
  def up
    change_column :positions, :kind, :string, null: true, default: nil
  end
end
