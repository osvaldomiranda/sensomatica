class HistoryPoint < ApplicationRecord
  belongs_to :user
  belongs_to :reserv
end
