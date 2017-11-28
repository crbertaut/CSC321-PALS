class Post < ActiveRecord::Base
    belongs_to :user, optional: true
    has_many :replies, dependent: :destroy
end