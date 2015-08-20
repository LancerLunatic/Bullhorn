class Moo < ActiveRecord::Base
  validates :content, presence: true #validate what? content, does the content exist? present
  belongs_to :user # belongs to who? user. User ID is associated with moo
end
