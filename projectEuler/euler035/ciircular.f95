program circularPrimes
  implicit none
  integer, external :: rotate
  integer, dimension(2:999999) :: primelist
  integer :: i, d, k, r, tot
  tot = 0
  primelist = (/ (I, I = 2, 999999) /)
  do d = 2, 1000
    do k = 2, (999999/d)
      primelist(d*k) = 0
    end do
  end do

  do i = 2, 999999
    if (primelist(i) /= 0) then
      r = rotate(primelist(i))
      if (primelist(r) == 0) then
        primelist(i) = 0
      end if
    end if
  end do

  do i = 2, 999999
    if (primelist(i) /= 0) then
      r = rotate(primelist(i))
      if (primelist(r) == 0) then
        primelist(i) = 0
      end if
    end if
  end do

  do i = 2, 999999
    if (primelist(i) /= 0) then
      r = rotate(primelist(i))
      if (primelist(r) == 0) then
        primelist(i) = 0
      end if
    end if
  end do

  do i = 2, 999999
    if (primelist(i) /= 0) then
      r = rotate(primelist(i))
      if (primelist(r) == 0) then
        primelist(i) = 0
      end if
    end if
  end do

  do i = 2, 999999
    if (primelist(i) /= 0) then
      r = rotate(primelist(i))
      if (primelist(r) == 0) then
        primelist(i) = 0
      end if
    end if
  end do

  do i = 2, 999999
    if (primelist(i) /= 0) then
      tot = tot + 1
      print *,i
    end if
  end do

  print *,tot

end program circularPrimes
!+++++++++++++++++++++++++++++++++++++++++++++++++
function rotate(N)
  implicit none
  integer rotate
  integer, intent(in) :: N
  integer :: d
  d = floor(log10(real(N))) 
  rotate = (N / 10) + (modulo(N,10))*(10**d)
  if (modulo(N,10) == 0) then
    rotate = 10**(d + 1) - 1
  end if
end function rotate
