program tilings
  implicit none
  integer(kind = 16) :: tiles
  integer :: i, j, ibest, jbest, d, dbest
  dbest = 2000000
  do i = 1, 5000
    do j = 1, 5000
      tiles = (i*(i+1)*j*(j+1))/4
      d = abs(2000000 - tiles)
      if (d < dbest) then
        dbest = d
        ibest = i
        jbest = j
        print *,i,j,tiles
      end if
    end do
  end do
end program tilings
