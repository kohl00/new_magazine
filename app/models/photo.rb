class Photo < ActiveRecord::Base
   has_attached_file :image, :styles => { :full => "640x480#", :medium => "300x300>", :thumb => "100x100>" }, :default_url => "http://placehold.it/350x200"
   validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
   
   validates :image, :attachment_presence => true


   belongs_to :article
  
end
