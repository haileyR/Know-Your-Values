class CreateUservalues < ActiveRecord::Migration
  def change
    create_table :uservalues do |t|
      t.references :user
      t.references :value
      t.integer :count
    end
  end
end
