class InserRolesData < ActiveRecord::Migration
  def change
    remove_column :users, :roles_mask
    Role.create(:name=>"admin")
    Role.create(:name=>"user")
    Role.create(:name=>"moderator")
  end
end
