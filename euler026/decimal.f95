program repeating
  integer :: n, k
  print *,huge(n)
  do n = 1, 1000
    k = isDecimaly(n)
    if (k > 1) then
      k = findCycle(k)
    else
      k = 0
    end if
    print *,n,k
  end do
  print *,huge(n)
end program repeating
!+++++++++++++++++++++++++++++++++++++++++++++++++
function isDecimaly(n) 
  integer, intent(in) :: n
  integer :: m
  m = n
  do while (modulo(m, 2) == 0)
    m = m / 2
  end do
  do while (modulo(m, 5) == 0)
    m = m / 5
  end do
  isDecimaly = m
end function isDecimaly
!+++++++++++++++++++++++++++++++++++++++++++++++++
function findCycle(k)
  integer, intent(in) :: k
  integer :: ord, bigguy
  ord = 1
  bigguy = 10
  do while (modulo(bigguy, k) /= 1)
    ord = ord + 1
    bigguy = modulo(bigguy*10, k)
  end do
  findCycle = ord
end function findCycle
