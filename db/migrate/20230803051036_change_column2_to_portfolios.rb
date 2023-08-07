class ChangeColumn2ToPortfolios < ActiveRecord::Migration[7.0]
  def change
    reversible do |dir|
      dir.up{ change_column :portfolios, :holding_status, :string}
      dir.down{ change_column :portfolios, :holding_status, :text}
    end
  end
end
