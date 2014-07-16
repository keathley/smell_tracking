# Smell Tracking

Tracking player movement by their 'smell'

## About

The goal is to create AI tracking using diffusion.  The board is divided up
into a grid.  The player emminates a "smell" throughout the board.  Each space
away from the player is reduced by the number of grid spaces that exist on the
board.  The agent then analyzes each of the adjacent spaces and can make
movement decisions based on those values.  For instance, if we wanted to create
an "aggresive" agent that always moved towards the player, we would simply have
that Agent move towards the largest adjacent space.

The other benefit of using this diffusion technique is that it makes avoiding
obstacles extremely simple.  We can simply treat obstacles as a 0 space.  Then
we have the agent only move into non-zero spaces.  0 could be any value; it's
really just a sentinal.  If we wanted we could substitute 0 for -1 and only
allow agents to move into non-negative spaces.