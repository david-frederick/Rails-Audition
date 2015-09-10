class ChangeColumnName < ActiveRecord::Migration
  def change
  	rename_column :photos, :trumbnail_url, :thumbnail_url
  end
end
