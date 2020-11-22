class CreateMessage < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.bigint :user_id
      t.bigint :room_id
      t.string :text
    end
  end
end
