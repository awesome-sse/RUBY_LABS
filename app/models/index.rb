class Index < ApplicationRecord
  validates :array, presence: true, uniqueness: true

  class << self
      def create_from_arr(arr, res, err, long)
        create array: arr, result: res, error: err, longest_one: long
      end
    end
end
