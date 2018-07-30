program quads
  implicit none
  integer, dimension (1:160000) :: nlist
  integer, dimension (1:15000) :: plist
  integer, dimension (-999:999, -1000:1000) :: dat
  integer :: c, d, m, i
  integer :: a, b, n, f
  integer, external :: isPrime
  integer :: maxy
  maxy = 0

  nlist = (/ (I, I = 1, 160000) /)
  c = 0
  do d = 2, 400
    do m = 2, (160000 / d)
      nlist(d*m) = 0
    end do
  end do

  do d = 2, 160000
    if (nlist(d) /= 0) then
      c = c + 1
      plist(c) = nlist(d)
    end if
  end do


  do n = 0, 70
    do a = -999, 999
      do b = -1000, 1000
        if (dat(a, b) == 0) then ! If the quad hasn't been disproved
          f = n*n + a*n + b
          if (f > maxy) then
            maxy = f
          end if
          dat(a, b) = isPrime(f, plist)
        end if
      end do
    end do
  end do

  c = 0
  do a = -999, 999
    do b = -1000, 1000
      if (dat(a, b) == 0) then
        c = c + 1
        print *,a,b
      end if
    end do
  end do
  print *,'count is',c
end program quads
!+++++++++++++++++++++++++++++++++++++++++++++++++
function isPrime(num,plist) ! Needs to return 0 on primes, 1 on baddies
  implicit none
  integer isPrime
  integer, intent(in) :: num
  integer, dimension(1:15000), intent(in) :: plist
  integer :: dex
  dex = 1
  isPrime = 1
  if (num > 1) then
    do while (num >= plist(dex))
      if (plist(dex) == num) then
        isPrime = 0
        EXIT
      end if
      dex = dex + 1
    end do
  end if
end function isPrime


