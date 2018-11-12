class Payload < ApplicationRecord
  belongs_to :mission
  belongs_to :nationality, optional:true
end
