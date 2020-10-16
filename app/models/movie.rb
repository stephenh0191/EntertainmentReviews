class Movie < ApplicationRecord
	belongs_to :user
	belongs_to :genre
	has_attached_file :movie_img, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
 	validates_attachment_content_type :movie_img, content_type: /\Aimage\/.*\z/
end
