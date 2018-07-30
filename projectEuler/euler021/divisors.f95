program amicable
  integer :: n, s, ss, total
  total = 0
  do n = 2, 10000
    s = sigma(n)
    ss = sigma(s)
    if (n == ss) then
      print *,n,s
      if (n /= s) then
        total = total + s
      end if
    end if
  end do
  print *,total
end program amicable
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


