class User < ActiveRecord::Base

	has_many :articles
	validates_uniqueness_of :email, :case_sensitive => false
end
