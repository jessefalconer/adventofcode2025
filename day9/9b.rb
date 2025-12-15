# in the dataset, find the most left and top point
# reduce the matrix by this amount so that
#
#  . . . .
#  . 0 . 0
#  . 0 0 .
#  . . . 0
#
# becomes
#
#  0 . 0
#  0 0 .
#  . . 0
#
# reduce all points by this amount, build the matrix
#
# contruct the perimeter by scanning vertically and horizontally once:
# * encountering an 0 begins a perimeter edge this first time
# * encountering another 0 encloses that perimeter, but also starts a new one
# * conditionally closing if it encounters another 0, or rejecting the recent coordinates
#   since the last 0 if the end of the matrix is encountered
# * repeat scan once more since new vertices have been added to enclose new points,
#   this is also fills in the bounded area
#
# * test combinations of coordinates
# * each rectangle will check if all?(&:zero?), count and store finding the max
