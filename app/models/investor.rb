class Investor < ApplicationRecord
    has_many :portfolios, dependent: :destroy
end
