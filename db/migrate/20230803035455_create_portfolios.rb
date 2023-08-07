class CreatePortfolios < ActiveRecord::Migration[7.0]
  def change
    create_table :portfolios do |t|
      t.string :stock_name
      t.string :bought_price
      t.text :is_holding

      t.timestamps
    end
  end
end
