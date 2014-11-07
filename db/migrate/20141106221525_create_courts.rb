class CreateCourts < ActiveRecord::Migration
  def change
    create_table :courts do |t|
      t.string :name
      t.references :region, index: true
      t.references :court_type, index: true

      t.timestamps
    end
  end
end
