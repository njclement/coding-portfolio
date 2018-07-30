program tiles
  implicit none
  integer(kind = 8), dimension (0:50) :: rgbTiles
  integer :: i

  rgbTiles(0) = 1
  rgbTiles(1) = 1
  rgbTiles(2) = 2
  rgbTiles(3) = 4

  do i = 4, 50
    rgbTiles(i) = rgbTiles(i-1) + rgbTiles(i-2) + rgbTiles(i-3) + rgbTiles(i-4)
    print *,i,rgbTiles(i)
  end do
  print *,huge(rgbTiles(1))
end program tiles

