class AddColumnToPortfolios < ActiveRecord::Migration[7.0]
  def change
    add_column :portfolios, :quantity, :string
  end
end
