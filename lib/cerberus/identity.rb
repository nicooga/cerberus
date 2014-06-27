class Cerberus::Identity < ActiveRecord::Base
  self.table_name = 'cerberus_identities'
  belongs_to :user, class_name: Cerberus.config[:identities][:user_class_name]

  validates :provider, :uid, presence: true
end
