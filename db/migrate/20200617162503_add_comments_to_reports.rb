class AddCommentsToReports < ActiveRecord::Migration[6.0]
  def change
    add_column :reports, :comments, :text, array:true, default: []
  end
end
