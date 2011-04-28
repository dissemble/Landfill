require 'landfill/g_c_snapshot'

module Landfill

  class << self

    # Sample output:
    #                        delta         pre        post  
    # num_allocations:         487         417          70
    # allocated_size:        14977       12256        2721
    # collections:               0           0           0
    # time:                      0           0           0
    # growth:              1320553       12256     1308297
    # live_objects:         124601        1606      122995
    #
    def measure
      enable_gc_stats
      snapshot_pre = take_snapshot
      yield
      snapshot_post = take_snapshot
      snapshot_delta = snapshot_post - snapshot_pre
      GCReview.new(snapshot_delta, snapshot_pre, snapshot_post)
    end

    def enable_gc_stats
      raise "your ruby does not support GC.enable_stats" unless GC.respond_to?(:enable_stats)
      puts "Enabled stats with GC.enable_stats" unless GC.enable_stats
    end

    def take_snapshot
      GCSnapshot.new(
        :num_allocations => GC.num_allocations,
        :allocated_size => GC.allocated_size,
        :collections => GC.collections,
        :time => GC.time,
        :growth => GC.growth,
        :live_objects => ObjectSpace.live_objects
        )
    end

  end
  
end

