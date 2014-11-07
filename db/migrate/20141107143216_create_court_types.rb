class CreateCourtTypes < ActiveRecord::Migration
  def change
    create_table :court_types do |t|
      t.string :name

      t.timestamps
    end
  end
end
