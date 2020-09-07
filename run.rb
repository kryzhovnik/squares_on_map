#!/usr/bin/env ruby

require 'rubygems'
require 'bundler/setup'
Bundler.require(:default)

require 'colorize'
require './lib/generator'
require './lib/square_seeker'
require './lib/map_drawer'

island = Generator.new.run(10, 15, 10)
seeker = SquareSeeker.new(island)

max, max_coords = seeker.seek
puts "Max square size: #{max}"
puts "Top-left corner: #{max_coords.join(',')}"
MapDrawer.new(island).draw(*max_coords)
