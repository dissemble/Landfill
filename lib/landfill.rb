require 'landfill/g_c_snapshot'

module Landfill

  class << self

    def measure
      enable_gc_stats
      snapshot_one = take_snapshot
      yield
      snapshot_two = take_snapshot
      snapshot_two - snapshot_one
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

