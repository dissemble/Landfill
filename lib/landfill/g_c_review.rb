# A pre-measurement snapshot, a post-measurement snapshot, and a delta all in one nifty object
module Landfill
  class GCReview
    attr_accessor :delta, :pre, :post

    def initialize(delta, pre, post)
      self.delta = delta
      self.pre = pre
      self.post = post
    end

    def to_s
      [ 
        "                  " + sprintf("%10s  ", "delta") + sprintf("%10s  ", "pre") + sprintf("%10s  ", "post"),
        "num_allocations:  " + sprintf("%10s  ", delta.num_allocations) + sprintf("%10s  ", pre.num_allocations) + sprintf("%10s", post.num_allocations),
        "allocated_size:   " + sprintf("%10s  ", delta.allocated_size) + sprintf("%10s  ", pre.allocated_size) + sprintf("%10s", post.allocated_size),
        "collections:      " + sprintf("%10s  ", delta.collections) + sprintf("%10s  ", pre.collections) + sprintf("%10s", post.collections),
        "time (ms):        " + sprintf("%10s  ", delta.time) + sprintf("%10s  ", pre.time) + sprintf("%10s", post.time),
        "growth:           " + sprintf("%10s  ", delta.growth) + sprintf("%10s  ", pre.growth) + sprintf("%10s", post.growth),
        "live_objects:     " + sprintf("%10s  ", delta.live_objects) + sprintf("%10s  ", pre.live_objects) + sprintf("%10s", post.live_objects)
        ].join("\n")
    end

  end
end