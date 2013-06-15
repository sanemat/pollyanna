class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.references :user, index: true, null: false
      t.text :body
      t.boolean :verified, default: false
      t.timestamp :verified_at

      t.timestamps
    end
  end
end
