class Cerberus::Identity < ActiveRecord::Base
  self.table_name = 'cerberus_identities'
  belongs_to :user, class_name: Cerberus.config.user_class

  validates :provider, :uid, presence: true
end
