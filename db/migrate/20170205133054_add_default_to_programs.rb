class AddDefaultToPrograms < ActiveRecord::Migration[5.0]
  def change
    add_column :programs, :default, :boolean, default: false
  end
end
