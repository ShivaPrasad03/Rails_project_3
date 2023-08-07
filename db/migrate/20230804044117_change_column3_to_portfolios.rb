class ChangeColumn3ToPortfolios < ActiveRecord::Migration[7.0]
  def change
    reversible do |dir|
      dir.up{ change_column :portfolios, :bought_price, :integer}
      dir.down{ change_column :portfolios, :bought_price, :string}
    end
  end
end
