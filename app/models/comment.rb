class Comment < ApplicationRecord
  belomgs_to :post
  belomgs_to :user
end
