# Smell Tracking

Tracking player movement by their 'smell'

## About

The goal is to create AI tracking using diffusion.  The board is divided up into a grid.  The player and all other entities - agents and rocks - are placed around the grid.  Each entity has a "smell" which we refer to as p.  The player has a very high smell, immovable objects have a smell of 0 and enemy agents have a low or 0 smell.  On each update we diffuse these smells throughout the floor.  Once this is done we can then provide the diffusion to the enemy agents and allow them to make decisions on based on the smell.  Assuming that the goal is to find the player as quickly as possible we simply have the enemy move towards the largest non-negative, adjacent space.

The benefit of using this diffusion technique is that it makes avoiding
obstacles trivial.  An agent will never move into a 0 or negative space which means that it will avoid both obstacles and other agents.

Using this diffusion technique also gives us some simple "collaboration" between the agents.  Since agents eminate a negative smell, each will seek to avoid the other.  This means that we get a close approximation of group like behaviour, essentially for free.

## Installing

You need gosu to run this example.  It can be installed on the latest version of
ruby 1.9.3 using the provided Gemfile.

    $ bundle install
    $ ruby smell_tracking.rb
