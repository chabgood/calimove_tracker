class AddAdminToUsers < ActiveRecord::Migration[8.0]
  def up
    add_column :users, :admin, :boolean, default: false
    User.find_by(email_address: 'chabgood@proton.me').update!(admin: true)
  end
end
