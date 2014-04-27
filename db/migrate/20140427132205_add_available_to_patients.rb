class AddAvailableToPatients < ActiveRecord::Migration
  def change
    add_column :patients, :available, :boolean
  end
end
