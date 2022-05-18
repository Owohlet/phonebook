class AddUpdatedByToHistories < ActiveRecord::Migration[5.2]
  def change
    add_column :histories, :updated_by, :string
  end
end
