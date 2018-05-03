program paths
  implicit none
  integer(kind = 8) :: T, T1, T2, T3, S, i
  T3 = 1
  T2 = 1
  T1 = 4
  S = 6
  do i = 4, 560000000
    T = modulo(2*S - T1 + T2 - T3,10**8)
    S = modulo(S + T,10**8)
    T3 = T2
    T2 = T1
    T1 = T
  end do
  print *,i,T,S
end program paths
   
