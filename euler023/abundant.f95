program abundant
  integer, dimension(2*28123) :: sad
  integer, dimension(7000) :: abund
  integer :: n, s, m, total, point, happy
  total = 0
  point = 0
  sad = (/ (I, I = 1, 2*28123) /)
  ! First we get a list of abundant numbers
  do n = 1, 28123
    s = sigma(n)
    if (s > n) then
      point = point + 1
      abund(point) = n
    end if
  end do
  ! Now zero out the numbers which are sums of abundant numbers
  do n = 1, point
    do m = 1, n
      happy = abund(n) + abund(m)
      sad(happy) = 0
    end do
  end do
  ! Now add up the sad numbers
  do n = 1, 28123
    total = total + sad(n)
  end do
  print *, total
end program abundant
!+++++++++++++++++++++++++++++++++++++++++++++++++
function sigma(N)
  integer :: d, t
  t = 0
  do d = 1, (N/2)
    if (modulo(n, d) == 0) then
      !print *,d,' divides ',n
      t = t + d
    end if
  end do
  sigma = t
end function sigma

