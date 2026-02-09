class AddOauthFieldsToUsers < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :email, :string
    add_column :users, :uid, :string
    add_column :users, :provider, :string
    add_column :users, :avatar_url, :string

    add_index :users, :email, unique: true
    add_index :users, [:uid, :provider], unique: true
  end
end
