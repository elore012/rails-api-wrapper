class CreateWrappers < ActiveRecord::Migration[6.1]
  def change
    create_table :wrappers do |t|

      t.timestamps
    end
  end
end
