class AddReferencePortfolios < ActiveRecord::Migration[7.0]
  def change
    add_reference :portfolios, :investor
  end
end
