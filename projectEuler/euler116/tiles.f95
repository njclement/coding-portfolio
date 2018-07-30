program tiles
  implicit none
  integer(kind = 8), dimension (1:50) :: redTiles, greenTiles, blueTiles
  integer :: i
  redTiles(1) = 1
  greenTiles(1) = 1
  blueTiles(1) = 1

  redTiles(2) = 2
  greenTiles(2) = 1
  blueTiles(2) = 1

  redTiles(3) = 3
  greenTiles(3) = 2
  blueTiles(3) = 1

  redTiles(4) = 5
  greenTiles(4) = 3
  blueTiles(4) = 2

  do i = 5, 50
    redTiles(i) = redTiles(i-1) + redTiles(i-2)
    greenTiles(i) = greenTiles(i-1) + greenTiles(i-3)
    blueTiles(i) = blueTiles(i-1) + blueTiles(i-4)
    print *,i,redTiles(i),greenTiles(i),blueTiles(i)
  end do
  print *,huge(redTiles(1))
  print *,(redTiles(50) + greenTiles(50) + blueTiles(50) - 3)
end program tiles

