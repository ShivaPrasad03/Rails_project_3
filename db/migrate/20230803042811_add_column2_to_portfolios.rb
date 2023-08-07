class AddColumn2ToPortfolios < ActiveRecord::Migration[7.0]
  def change
    add_column :portfolios, :total_Shares, :string
  end
end
