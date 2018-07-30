program collectpoints
  implicit none
  integer(8) :: x0 = -100, x1 = 100, y0 = -100, y1 = 100
  integer(8) :: A, B, x, y, z, w,t,s
  integer, allocatable :: raw_data(:,:)
  integer(8), external :: gcd

  allocate( raw_data(-100:100,-100:100) )


  do A = x0, x1
    do B = y0, y1
      if (modulo(B,2) == 1 .AND. mod(A,2) == 0 .AND. gcd(A,B) == 1) then
        raw_data(A,B) = 1
      end if
    end do
  end do

  open(7,file="rawdata.bin",form="unformatted",access="sequential")
  write(7) x0,x1,y0,y1
  write(7) raw_data
  close(7)
end program collectpoints
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function gcd(a,b)
  implicit none
  integer(8) gcd 
  integer(8), intent(in) :: a,b
  integer(8) :: x, y , z
  x = abs(a)
  y = abs(b)
  if (x == 0 .AND. y == 0) then
    gcd = 0
    return
  end if
  do while (y /= 0) 
    z = mod(x,y)
    x = y 
    y = z
    end do
  gcd = x
end function 

