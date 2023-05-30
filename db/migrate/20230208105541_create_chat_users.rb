class CreateChatUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :chat_users do |t|
      t.references :user, null: false, foreign_key: true
      t.references :chat, null: false, foreign_key: true
      t.references :clinic, null: false, foreign_key: true

      t.timestamps
    end
  end
end
