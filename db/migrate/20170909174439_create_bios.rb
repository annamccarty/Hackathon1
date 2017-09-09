class CreateBios < ActiveRecord::Migration[5.1]
  def change
    create_table :bios do |t|
      t.string :profile_image
      t.text :description
      t.integer :user_id

      t.timestamps
    end
  end
end
