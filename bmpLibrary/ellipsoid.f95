program collectpoints
  implicit none
  integer(8) :: picWidth = 1000, zero = 0, picHeight = 800
  integer(8) :: A, B, C, m, n, D, Dsquared
  integer(8), external :: isSquare
  integer, allocatable :: raw_data(:,:)
  integer(8) :: height

  allocate( raw_data(0:picWidth,0:picHeight) )

  height = 2000

  do A = 0, height
    do B = 0, height
      do C = 0, height
        Dsquared = A*A + B*B + 3*C*C
        if (Dsquared > height*height) then
          CYCLE
        endif
        D = isSquare(Dsquared)
        if (D > 0) then
          m = nint(real(picWidth*B)/real(D))
          n = nint(real(picWidth*C)/real(D))
          raw_data(m, n) = raw_data(m, n) + 1
        end if
      end do
    end do
  end do

  open(7,file="rawdata.bin",form="unformatted",access="sequential")
  write(7) zero, picWidth, zero, picHeight
  write(7) raw_data
  close(7)
end program collectpoints
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function isSquare(x) ! solve y^2 = x if possible
  implicit none
  integer(8) isSquare
  integer(8), intent(in) :: x
  integer(8) :: y
  y = int(real(x)**(1./2))
  if (y**2 .NE. x) then
    y = 0 
  end if
  isSquare = y
end function isSquare
