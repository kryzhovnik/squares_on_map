class SquareSeeker
  attr_reader :island, :size

  def initialize(island)
    @island = island
    @size = island[0].size
  end

  def seek
    max = 0
    max_coords = []
    (0..(size - 1)).each do |i|
      (0..(size - 1)).each do |j|
        local_max = max_square(i, j)
        if local_max > max
          max = local_max
          max_coords = [i, j]
        end
      end
    end
    # p max_coords
    return max, max_coords
  end

  private
    def max_square(i, j)
      deep = 0
      while perimeter?(i, j, deep)
        deep += 1
      end
      deep
    end

    def perimeter?(x, y, d)
      return false if (x + d) >= size || (y + d) >= size

      (0..d).all? { |n| @island[x + n][y] } && \
        (0..d).all? { |n| @island[x + d][y + n] } && \
        (0..d).all? { |n| @island[x + n][y + d] } && \
        (0..d).all? { |n| @island[x][y + n] }
    end
end
