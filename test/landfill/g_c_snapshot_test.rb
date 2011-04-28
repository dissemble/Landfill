require 'test_helper'

module Landfill
  class GCSnapshotTest < Test::Unit::TestCase

    def test_can_initialize_with_values
      gc_info = GCSnapshot.new(
      :num_allocations => 1,
      :allocated_size => 2,
      :collections => 3,
      :time => 4,
      :growth => 5,
      :live_objects => 6
      )

      assert_equal 1, gc_info.num_allocations
      assert_equal 2, gc_info.allocated_size
      assert_equal 3, gc_info.collections
      assert_equal 4, gc_info.time
      assert_equal 5, gc_info.growth
      assert_equal 6, gc_info.live_objects
    end


    def test_can_reassign_values
      gc_info = GCSnapshot.new(
        :num_allocations => 0,
        :allocated_size => 0,
        :collections => 0,
        :time => 0,
        :growth => 0,
        :live_objects => 0
      )
      
      gc_info.reassign(
        :num_allocations => 1,
        :allocated_size => 2,
        :collections => 3,
        :time => 4,
        :growth => 5,
        :live_objects => 6
      )

      assert_equal 1, gc_info.num_allocations
      assert_equal 2, gc_info.allocated_size
      assert_equal 3, gc_info.collections
      assert_equal 4, gc_info.time
      assert_equal 5, gc_info.growth
      assert_equal 6, gc_info.live_objects

      gc_info.reassign(
        :num_allocations => 22
      )
           
      assert_equal 22, gc_info.num_allocations
      assert_equal nil, gc_info.allocated_size
      assert_equal nil, gc_info.collections
      assert_equal nil, gc_info.time
      assert_equal nil, gc_info.growth
      assert_equal nil, gc_info.live_objects
    end
    
    
    def test_can_subtract_gcsnapshot_objects
      gc_info1 = GCSnapshot.new(
        :num_allocations => 10,
        :allocated_size => 9,
        :collections => 1,
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
      assert_equal 90, gc_info3.num_allocations
      assert_equal 91, gc_info3.allocated_size
      assert_equal 0, gc_info3.collections
      assert_equal 93, gc_info3.time
      assert_equal 94, gc_info3.growth
      assert_equal 95, gc_info3.live_objects
    end
    
    
    def test_subtracting_gcsnapshot_when_gc_has_fired
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
      assert_equal 90, gc_info3.num_allocations
      assert_equal 91, gc_info3.allocated_size
      assert_equal 1, gc_info3.collections
      assert_equal 93, gc_info3.time
      assert_equal "-", gc_info3.growth
      assert_equal "-", gc_info3.live_objects
    end
      

  end
end
