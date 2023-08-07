class RemoveColumnToPortfolios < ActiveRecord::Migration[7.0]
  def change
    
      remove_column :portfolios, :total_Shares, :string
  end
end
