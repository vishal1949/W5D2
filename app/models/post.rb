class Post < ApplicationRecord
  validates :title, :content, :user_id, :sub_id, presence: true
  
  before_action :require_login 
  belongs_to :user,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: 'User'

  belongs_to :sub,
  primary_key: :id,
  foreign_key: :sub_id,
  class_name: 'Sub'
  
end 

