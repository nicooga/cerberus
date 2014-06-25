class CreateCerberusIdentities < ActiveRecord::Migration
  def change
    create_table :cerberus_identities do |t|
      t.string :provider, index: true
      t.string :uid, index: true
      t.references :user
    end
  end
end
