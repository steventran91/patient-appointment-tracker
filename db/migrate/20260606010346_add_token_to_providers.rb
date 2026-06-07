class AddTokenToProviders < ActiveRecord::Migration[8.1]
  def change
    add_column :providers, :token, :string
  end
end
