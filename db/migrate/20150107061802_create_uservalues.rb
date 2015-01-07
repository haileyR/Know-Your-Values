class CreateUservalues < ActiveRecord::Migration
  def change
    create_table :uservalues do |t|
      t.references :user_id
      t.references :value_id
      t.integer :count
    end
  end
end
