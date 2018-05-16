class RestructureUserOrganizationRelationship < ActiveRecord::Migration[5.1]
  def change
    add_column :organizations, :avatar_file_name, :string
    add_column :organizations, :avatar_content_type, :string
    add_column :organizations, :avatar_file_size, :integer
    add_column :organizations, :avatar_updated_at, :datetime
    add_column :organizations, :city, :string
    add_column :organizations, :state, :string
    add_column :organizations, :street_address, :string
    add_column :organizations, :zipcode, :string
    add_column :organizations, :latitude, :float
    add_column :organizations, :longitude, :float
    add_column :organizations, :bio, :text
    
    # Devise stuff
    add_column :organizations, :encrypted_password, :string, null: false, default: ""
    add_column :organizations, :reset_password_token, :string
    add_column :organizations, :reset_password_sent_at, :datetime
    add_column :organizations, :remember_created_at, :datetime
    add_column :organizations, :sign_in_count, :integer, default: 0, null: false
    add_column :organizations, :current_sign_in_at, :datetime
    add_column :organizations, :last_sign_in_at, :datetime
    add_column :organizations, :current_sign_in_ip, :string
    add_column :organizations, :last_sign_in_ip, :string
    add_column :organizations, :confirmation_token, :string
    add_column :organizations, :confirmed_at, :datetime
    add_column :organizations, :confirmation_sent_at, :datetime
    add_column :organizations, :unconfirmed_email, :string
  end
end
