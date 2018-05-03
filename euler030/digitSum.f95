program digitSum
  implicit none
  integer, external :: sum5
  integer :: n, s, tot

  tot = 0
  do n = 2, 1000000
    s = sum5(n)
    if (n == s) then
      print *,n
      tot = tot + n
    end if
  end do
  print *,tot
  print *,"Done. Integer capacity to ",huge(tot)
end program digitSum
!+++++++++++++++++++++++++++++++++++++++++++++++++
function sum5(n)
  implicit none
  integer sum5
  integer, intent(in) :: n
  integer :: m

  sum5 = 0
  m = n
  do while (m > 0)
    sum5 = sum5 + (modulo(m, 10)**5)
    m = m / 10
  end do
  return
end function sum5
