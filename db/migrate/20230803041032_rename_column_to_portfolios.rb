class RenameColumnToPortfolios < ActiveRecord::Migration[7.0]
  def change
    rename_column :portfolios, :is_holding, :holding_status
  end
end
