class Item < ActiveRecord::Base

	attr_accessible :name, :description, :abstract, :category_id, :price
	attr_accessible :image, :remote_image_url, :remove_image
	
	belongs_to :category, :readonly=>true


	mount_uploader :image, ImageUploader

end