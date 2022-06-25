class ChangeColumnDefaultToPublics < ActiveRecord::Migration[6.1]
  def change
    change_column_default :publics, :is_deleted, from: nil, to: "false"
  end
end
