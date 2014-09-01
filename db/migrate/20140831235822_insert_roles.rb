class InsertRoles < ActiveRecord::Migration
  def change
    Role.create(:name=>"author")
  end
end
