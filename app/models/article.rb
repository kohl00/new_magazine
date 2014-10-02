class Article < ActiveRecord::Base

	belongs_to :user

	validates_presence_of :title,length: {minimum: 20, maximum:100}, :message =>" Enter a valid title. Minimum of 20 characters"

	validates_presence_of :category, presence: true

	#validates_presence_of :content, presence: true, length: {minimum: 500, maximum: 1000}

	validates_associated :photos, :message => "Please use a valid image"

	has_many :photos, dependent: :destroy
	
	accepts_nested_attributes_for :photos, reject_if: proc { |attributes| attributes['image'].blank?} 

	def author
		if user.present?
			[user.first_name, user.last_name].reject(&:blank?).join(' ')
		else
			"author name"
		end
	end
end
