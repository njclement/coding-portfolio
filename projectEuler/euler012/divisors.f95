program divisors
  integer :: n, m, tauNew, tauOld
  n = 2
  tauOld = 1
  tauNew = 1 
  do while (tauNew*tauOld < 500)
    m = n
    if (modulo(n, 2) == 0) then
      m = n/2
    end if
    tauOld = tauNew
    tauNew = tau(m)
    print *,'n = ',n,'taus = ',tauOld,tauNew
    n = n + 1
  end do
end program divisors
!+++++++++++++++++++++++++++++++++++++++++++++++++
function tau(N)
  integer :: N, d, t
  t = 1
  do d = 1, (N/2)
    if (modulo(n, d) == 0) then
      !print *,d,' divides ',n
      t = t + 1
    end if
  end do
  tau = t
end function tau


