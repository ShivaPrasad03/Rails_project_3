class ChangeColumn4ToPortfolios < ActiveRecord::Migration[7.0]
  def change
    reversible do |dir|
      dir.up{ change_column :portfolios, :holding_status, :integer}
      dir.down{ change_column :portfolios, :holding_status, :string}
    end
  end
end
