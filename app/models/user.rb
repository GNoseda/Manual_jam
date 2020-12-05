class User < ApplicationRecord
    has_secure_password
    validates :name, :password_confirmation, presence: true
    validates :email, presence: true, uniqueness: {case_sensitive: true}

    has_many :stories

    def stories_count
        self.stories.count
    end
end
