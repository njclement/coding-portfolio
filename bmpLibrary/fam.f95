program collectpoints
  implicit none
  integer(8) :: picWidth = 1000, zero = 0
  integer(8) :: A, B, C, m, n, D, Dsquared, Si
  real :: Ar, Br, Dr, heightr, S, f, fudge
  integer(8), external :: isSquare
  integer, allocatable :: raw_data(:,:)
  integer(8) :: height
  real, dimension(1:9) :: L


  allocate( raw_data(0:picWidth,0:picWidth) )

  height = 1000
  heightr = 1000.0
  L = (/ 1./7.,1./13.,3./13.,4./19.,7./37.,3./19.,1./16.,1./9.,1./19. /)

  do Si = 1,9
    S = L(Si)
    fudge = (1-2*(((3*s**2 - sqrt(3.0)*sqrt(s - s**4))/(4*s**3 - 1)))**3)**(-2/3)*(-6*(((3*s**2 - sqrt(3.0)*sqrt(s - s**4))/(4*s**3 - 1)))**2) - 6*s
    do A = 0, height
      do B = 0, height
        Ar = real(A)/heightr
        Br = real(B)/heightr
        f = Ar**3 + Br**3 + (1-Ar*s -Br*s)**3
        Dr = abs((1 - f)/fudge)
        if (Dr < .0005 .AND. (Ar**3 + Br**3 < 1.0) ) then
          raw_data(A,B) = 1
        end if
      end do
    end do
  end do

  open(7,file="rawdata.bin",form="unformatted",access="sequential")
  write(7) zero, picWidth, zero, picWidth
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
