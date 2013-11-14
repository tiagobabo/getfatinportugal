class CreatePaymentPlans < ActiveRecord::Migration
  def change
    create_table :payment_plans do |t|
      t.references :client
      t.references :service_modality
      t.integer :balance
      t.datetime :initial_date
      t.datetime :end_date

      t.timestamps
    end
    add_index :payment_plans, :client_id
    add_index :payment_plans, :service_modality_id
  end
end
