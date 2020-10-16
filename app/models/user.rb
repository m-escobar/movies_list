class User < ApplicationRecord
  belongs_to :age
  belongs_to :occupation
  has_many :rating
end
