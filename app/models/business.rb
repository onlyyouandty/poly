class Business < ActiveRecord::Base
	has_many :interactions, as: :interactive
	has_one :user, as: :meta, dependent: :destroy
	accepts_nested_attributes_for :user
end
