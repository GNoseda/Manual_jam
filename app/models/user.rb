class User < ApplicationRecord
    has_secure_password
    validates :name, :password_confirmation, presence: true
    validates :email, presence: true, uniqueness: {case_sensitive: true}
end
