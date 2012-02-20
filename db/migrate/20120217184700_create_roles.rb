class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :resource_classname
      t.boolean :can_read
      t.boolean :can_create
      t.boolean :can_update
      t.boolean :can_destroy

      t.timestamps
    end
  end
end
