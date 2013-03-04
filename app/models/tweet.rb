# == Schema Information
#
# Table name: tweets
#
#  id         :integer          not null, primary key
#  content    :string(255)
#  user_id    :integer
#  has_answer :boolean          default(FALSE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Tweet < ActiveRecord::Base
  attr_accessible :has_answer, :content, :user_id
  has_and_belongs_to_many :hashtags
  belongs_to :user
  validates :content, :length => { :minimum => 10 }

  def find_hashtags
    search = content.gsub(/[.?!]/, "")
    search.split.keep_if { |x| x.include?("#") }
  end
end
