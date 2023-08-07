class ChangeColumnToPortfolios < ActiveRecord::Migration[7.0]
  def change
    reversible do |dir|
      dir.up{ change_column :portfolios, :quantity, :integer}
      dir.down{ change_column :portfolios, :quantity, :string}
    end

  end
end
