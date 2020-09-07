class MapDrawer
  attr_reader :island

  def initialize(island)
    @island = island
  end

  def draw(x=nil, y=nil)
    s = island[0].size - 1

    (0..s).each do |i|
      (0..s).each do |j|
        if island[i][j]
          if x == i and y == j
            print ' ↘ '.colorize(:color => :light_blue, :background => :red)
          else
            print ' ■ '
          end
          # print ' ↘ '.red
        else
          print '   '
        end
      end
      puts
    end
  end
end
