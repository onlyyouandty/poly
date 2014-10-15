class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

         belongs_to :meta, polymorphic: true
         accepts_nested_attributes_for :meta

  #The different user types defined in an array the %w[admin student profile] is ruby shorthand for ["admin", "student", "company"]
  META_TYPES = %w[person business]

end
