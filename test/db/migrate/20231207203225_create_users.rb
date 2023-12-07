# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :email, limit: 100
      t.string :first_name, limit: 50, index: true
      t.string :last_name, limit: 50, index: true
      t.string :phone, limit: 25, index: true

      t.timestamps
    end

    add_index :users, :email, unique: true
    add_index :users, :created_at
    add_index :users, :updated_at
  end
end
