program collectpoints
  implicit none
  integer(8) :: x0 = -100, x1 = 100, y0 = -100, y1 = 100
  integer(8) :: A, B, x, y, z, w,t,s
  integer, allocatable :: raw_data(:,:)

  allocate( raw_data(-100:100,-100:100) )


  do x = -10, 10
    do y = -10,10
      do z = -10,10
        do w = -10,10
          do t = -10,10
            do s = -10,10
              A = 1 + x*y + x*w + z*w + x*y*z*w + s*(x + z + x*y*z + t*(1 + x*y + x*w + z*w + x*y*z*w))
              B = x + z + x*y*z + t*(1 + x*y + x*w + z*w + x*y*z*w)
              if (A > 100 .OR. A < -100 .OR. B > 100 .OR. B < -100) then
                CYCLE
              end if
              raw_data(A,B) = 1
            end do
          end do
        end do
      end do
    end do
  end do

  open(7,file="rawdata.bin",form="unformatted",access="sequential")
  write(7) x0,x1,y0,y1
  write(7) raw_data
  close(7)
end program collectpoints
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
