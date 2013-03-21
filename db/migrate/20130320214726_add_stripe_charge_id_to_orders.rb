class AddStripeChargeIdToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :stripe_charge_id, :string
    add_column :orders, :subscription_id, :integer
  end
end
