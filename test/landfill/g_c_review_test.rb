require 'test_helper'

module Landfill
  class GCReviewTest < Test::Unit::TestCase

    def test_vanilla_to_s
      gc_info = Landfill.measure {}
      gc_info.to_s
    end

    def test_to_s_with_na_values
      gc_info1 = GCSnapshot.new(
      :num_allocations => 10,
      :allocated_size => 9,
      :collections => 0,
      :time => 7,
      :growth => 6,
      :live_objects => 5
      )

      gc_info2 = GCSnapshot.new(
      :num_allocations => 100,
      :allocated_size => 100,
      :collections => 1,
      :time => 100,
      :growth => 100,
      :live_objects => 100
      )

      gc_info3 = gc_info2 - gc_info1
      
      review = GCReview.new(gc_info3, gc_info1, gc_info2)
      review.to_s
    end
  end
end
