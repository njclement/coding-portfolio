program collectpoints
  implicit none
  integer(8) :: picWidth = 1000
  integer(8) :: A, B, C, m, n, D, Dcubed
  integer(8), external :: isCube
  integer, allocatable :: raw_data(:,:)
  integer(8) :: height, width

  allocate( raw_data(0:picWidth,0:picWidth) )

  height = 500


  do C = 0, height
    do B = 0, C
      do A = 0, B
      ! A <= B <= C
        Dcubed = A*A*A + B*B*B + C*C*C
        if (Dcubed > height*height*height) then
          CYCLE
        endif
        D = isCube(Dcubed)
        if (D > 0) then
          print *,A,",",B,",",C,",",D
          m = nint(real(picWidth*B)/real(D))
          n = nint(real(picWidth*C)/real(D))
          raw_data(m, n) = raw_data(m, n) + 1
        end if
      end do
    end do
  end do

  open(7,file="rawdata.bin",form="unformatted",access="sequential")
  write(7) raw_data
  close(7)
end program collectpoints
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function isCube(x) ! solve y^3 = x if possible
  implicit none
  integer(8) isCube
  integer(8), intent(in) :: x
  integer(8) :: y
  y = int(real(x)**(1./3))
  if (y**3 .NE. x) then
    y = 0 
  end if
  isCube = y
end function isCube
