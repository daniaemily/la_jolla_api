class Product < ActiveRecord::Base
  enum container_material: [ :aluminum, :plastic, :glass ]
  has_many :packages
end
