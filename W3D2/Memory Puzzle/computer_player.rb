class ComputerPlayer

end

# 1. create valid_moves [[0,0], [0,1], [0,2]...[size-1, size-1]]
# 2. human player start to play
#     1. get move
#       first = [index_0, index_1]
#       second = [index_2, index_3]
#     if first match second
#         valid_moves.delete(first, second)
#         reveal card at first and second forever
#     else means not match
#       guessed_not_hit << first, second
#       hide first second
#     end

#     human_player finished
#     2. Switch!

# 3. computer player start to play
#    1. check guessed_not_hit
#       if there are two positions inside has the same face_val
#         first move = take one of them
#       else
#         random a first pos
#         @computer_player.previous_pos = first_pos
#       end
#     2. check guessed_not_hit
#       if there is one has the same face_val as the @computer.previous_pos
#         fill the pos
#         reveal forever
#         delete from valid_moves
#       if no match in guessed not gue


# A B A B
# C C D D
# E K F E
# K N N F

# round 1 
# human player = 0 1, 0 2 => B A hidden [0, 1, B], [0,2, A] => guessed_but_not_hit
# round 2
# human player = 1 0, 0 0 => C A hide [1,0, C], [0, 0, A] => guessed_not_hit

# computer started

# checking the guessed_not_hit([0,2,A], [0,0,A])