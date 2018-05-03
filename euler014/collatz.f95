program longHail
  integer(kind=8) :: n, m, bestSeed, bestLength
  bestSeed = 1
  bestLength = 0
  do n = 2, 1000000
    length = runHail(n)
    if (length > bestLength) then
      bestSeed = n
      bestLength = length
      print *,n,length
    end if
  end do
end program longHail

function runHail(n)
  integer(kind=8) :: m, c
  m = n 
  c = 0
  do while(m > 1)
    if (modulo(m, 2) == 0) then
      m = m / 2
      c = c + 1
    else
      m = 3*m + 1
      c = c + 1
    end if
  end do
  runHail = c
end function runHail
