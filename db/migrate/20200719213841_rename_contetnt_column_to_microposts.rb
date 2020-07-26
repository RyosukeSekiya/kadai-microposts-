class RenameContetntColumnToMicroposts < ActiveRecord::Migration[5.2]
  def change
    rename_column :microposts, :contetnt, :content
  end
end
