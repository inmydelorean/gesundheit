class CreateAppointments < ActiveRecord::Migration[7.0]
  def change
    create_table :appointments do |t|
      t.datetime :time
      t.references :user, null: false, foreign_key: true
      t.references :doctor, null: false, foreign_key: true
      t.text :description
      t.boolean :completed, default: false

      t.timestamps
    end
  end
end
