program color
  implicit none
  integer(kind = 16), dimension(0:25,0:75) :: deWay
  integer(kind = 16) :: waysA, waysB
  integer :: i, j, s
  waysA = 65269402
  waysB = 584582888
  

  deWay(0,0) = 1984*1983
  do i = 1, 25
    deWay(i,0) = waysA * deWay(i-1,0)
    deWay(i,0) = modulo(deway(i,0),1000000000)
  end do
  do j = 1, 75
    deWay(0,j) = waysB * deWay(0,j-1)
    deWay(0,j) = modulo(deway(0,j),1000000000)
  end do
  do s = 2, 100
    do i = 1, s-1
      j = s - i
      if (i <= 25 .AND. j <= 75) then
        !print *,i,j
        deWay(i,j) = waysA * deWay(i-1,j) + waysB * deWay(i,j-1)
        deWay(i,j) = modulo(deWay(i,j),1000000000)
      end if
    end do
  end do
  !print *,deWay(0:5,0:5)
  print *,huge(deway(0,0))
  print *,deWay(25,75)
end program color
