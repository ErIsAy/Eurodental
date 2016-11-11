class Store < ActiveRecord::Base
  belongs_to :sale

  belongs_to :worktype
  belongs_to :material
  belongs_to :mcolor
  belongs_to :gcolor
  belongs_to :procedure

end
