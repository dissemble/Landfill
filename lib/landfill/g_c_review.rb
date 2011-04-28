# A pre-measurement snapshot, a post-measurement snapshot, and a delta all in one nifty object
module Landfill
  class GCReview
    attr_accessor :pre, :post, :delta
    
    def initialize(pre, post, delta)
      self.pre = pre
      self.post = post
      self.delta = delta
    end
    
    def to_s
      [ 
        "                  " + sprintf("%10s  ", "delta") + sprintf("%10s  ", "pre") + sprintf("%10s  ", "post"),
        "num_allocations:  " + sprintf("%10d  ", delta.num_allocations) + sprintf("%10d  ", pre.num_allocations) + sprintf("%10d", post.num_allocations),
        "allocated_size:   " + sprintf("%10d  ", delta.allocated_size) + sprintf("%10d  ", pre.allocated_size) + sprintf("%10d", post.allocated_size),
        "collections:      " + sprintf("%10d  ", delta.collections) + sprintf("%10d  ", pre.collections) + sprintf("%10d", post.collections),
        "time:             " + sprintf("%10d  ", delta.time) + sprintf("%10d  ", pre.time) + sprintf("%10d", post.time),
        "growth:           " + sprintf("%10d  ", delta.growth) + sprintf("%10d  ", pre.growth) + sprintf("%10d", post.growth),
        "live_objects:     " + sprintf("%10d  ", delta.live_objects) + sprintf("%10d  ", pre.live_objects) + sprintf("%10d", post.live_objects)
        ].join("\n")
    end
    
    
  end
end