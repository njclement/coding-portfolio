program unconcealed
  implicit none
  integer :: p, q, n, phi, e, m
  integer, external :: gcd
  integer(kind = 8) :: hash
  p = 1009
  q = 3643

  n = p * q
  phi = (p - 1) * (q - 1)
  
  hash = 0
  do e = 1, phi
    if (gcd(e,phi) == 1) then
      if ((gcd(e-1,p-1) + 1)*(gcd(e-1,q-1) + 1) == 9) then
        hash = hash + e
      end if
    end if
  end do
  print *,hash
  print *,huge(hash)
end program unconcealed
!+++++++++++++++++++++++++++++++++++++++++++++++++
function gcd(a,b)
  implicit none
  integer gcd
  integer, intent(in) :: a, b
  integer :: x, y, z
  x = a
  y = b
  if (x == 0) then
    gcd = y
  else if (y == 0) then
    gcd = x
  else
    do while (y > 0)
      z = modulo(x,y)
      x = y
      y = z
    end do
    gcd = x
  end if
end function gcd
