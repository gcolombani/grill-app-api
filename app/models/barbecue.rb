class Barbecue < ApplicationRecord
  belongs_to :owner, :class_name => 'User', :foreign_key => 'owner_id'
  def self.json_options
    {
      include: [:owner]
    }
  end
end
