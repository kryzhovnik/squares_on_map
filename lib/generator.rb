class Generator
  def run(d, density=15, islandness=10)
    @island = []
    (0..d).each do |i|
      (0..d).each do |j|
        @island[i] ||= []
        @island[i][j] ||= rand(density + probability(i, j) * islandness) >= 10
      end
    end
    @island
  end

  def probability(x, y)
    prob = 0
    prob += 1 if @island[x-1] && @island[x-1][y]
    prob += 1 if @island[x+1] && @island[x+1][y]
    prob += 1 if @island[x] && @island[x][y-1]
    prob += 1 if @island[x] && @island[x][y+1]
    prob * 1.0 / 4
  end
end
