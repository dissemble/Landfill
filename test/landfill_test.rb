require 'test_helper'

class LandfillTest < Test::Unit::TestCase

  def test_landfill_measure
    gc_info = Landfill.measure do
      # do nothing
    end
    assert (gc_info.num_allocations < 20)


    gc_info = Landfill.measure do
      400.times do
        "Look ma, I made" + " a new string"
      end
    end
    assert (gc_info.num_allocations > 400)
  end
  
  
  def test_take_snapshot_creates_a_gcsnapshot
    gc_info = Landfill.take_snapshot
    assert_not_nil gc_info
    assert_equal Landfill::GCSnapshot, gc_info.class
  end
  

  def test_enable_gc_stats_raises_when_enable_stats_is_not_supported
    GC.expects(:respond_to?).with(:enable_stats).returns(false)
    assert_raises RuntimeError do
      Landfill.enable_gc_stats
    end
  end

  def test_enable_gc_stats_when_stats_were_already_on
    GC.expects(:respond_to?).with(:enable_stats).returns(true)
    GC.expects(:enable_stats).returns(false)
    Landfill.enable_gc_stats
  end

  def test_enable_gc_stats_when_stats_were_off
    GC.expects(:respond_to?).with(:enable_stats).returns(true)
    GC.expects(:enable_stats).returns(true)
    Landfill.enable_gc_stats
  end

end

