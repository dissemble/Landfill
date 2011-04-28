module Landfill
  class GCSnapshot
    attr_accessor :num_allocations, :allocated_size, :collections, :time, :growth, :live_objects

    def initialize(values)
      self.reassign values
    end

    def reassign(values)
      self.num_allocations = values[:num_allocations]
      self.allocated_size = values[:allocated_size]
      self.collections = values[:collections]
      self.time = values[:time]
      self.growth = values[:growth]
      self.live_objects = values[:live_objects]
    end


    def -(other)
      computed_collections = self.collections - other.collections
      if computed_collections > 0
        computed_growth = "-"
        computed_live_objects = "-"
      else
        computed_growth = self.growth - other.growth
        computed_live_objects = self.live_objects - other.live_objects
      end
      
      
      GCSnapshot.new(
      :num_allocations => self.num_allocations - other.num_allocations,
      :allocated_size => self.allocated_size - other.allocated_size,
      :collections => computed_collections,
      :time => self.time - other.time,
      :growth => computed_growth,
      :live_objects => computed_live_objects
      )
    end

    def to_s
      [ 
        "num_allocations:  #{num_allocations}",
        "allocated_size:  #{allocated_size}",
        "collections:  #{collections}",
        "time:  #{time}",
        "growth:  #{growth}",
        "live_objects:  #{live_objects}"
        ].join("\n")
    end
  end
end