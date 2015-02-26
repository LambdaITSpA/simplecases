class AddPeriodicityAndPeriodicityMeasureToCauses < ActiveRecord::Migration
  def change
    add_column :causes, :periodicity, :integer
    add_column :causes, :periodicity_measure, :integer
  end
end
