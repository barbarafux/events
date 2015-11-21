class CreateEvent < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.datetime :start_date
      t.datetime :end_date
      t.string :website
      t.references :venue, index: true, foreign_key: true
      t.references :city, index: true, foreign_key: true
    end
  end
end
