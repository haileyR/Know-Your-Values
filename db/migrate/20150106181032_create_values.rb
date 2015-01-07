class CreateValues < ActiveRecord::Migration
  def change
    create_table :values do |t|
      t.string :word
    end
  end
end
