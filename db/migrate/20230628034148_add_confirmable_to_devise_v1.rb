class AddConfirmableToDeviseV1 < ActiveRecord::Migration[7.0]
  class AddConfirmableToDeviseV1 < ActiveRecord::Migration
    def change
      change_table(:users) do |t| 
        t.confirmable 
      end
      add_index  :users, :confirmation_token, :unique => true 
    end
  end
  
end
