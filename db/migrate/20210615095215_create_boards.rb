class CreateBoards < ActiveRecord::Migration[6.0]
  def change
    create_table :boards do |t|
      t.references  :user, null: false
      t.string  :name,  null: false, default: ""
      t.text    :description,  null: false, default: ""
      t.timestamps
    end
  end
end
