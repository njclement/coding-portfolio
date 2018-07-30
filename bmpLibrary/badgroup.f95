program collectpoints
  implicit none
  integer(8) :: x0 = -200, x1 = 200, y0 = -200, y1 = 200
  integer(8) :: A, B, x, y, z, w,t,s,i,j
  integer, allocatable :: rare_data(:,:), raw_data(:,:)

  allocate( raw_data(-300:300,-300:300) )
  allocate( rare_data(x0:x1,y0:y1) )


  do x = x0,x1
    do y = x0,x1
      do z = x0,x1
        A = 2*x + 2*z + 4*x*y*z
        B = 1 + 2*x*y
        if (A > 300 .OR. A < -300 .OR. B > 300 .OR. B < -300) then
          CYCLE
        end if
        raw_data(A,B) = 1
      end do
    end do
  end do

!  raw_data(0,1) = 1

  do z = 1,0
    ! Act by ((1,0)(1,1))
    do i = -1000,1000
      do j = -1000,1000
        if (raw_data(i,j)>0) then
          A = i
          do x = -100,100
            B = i*x + j
            if (B > 1000 .OR. B < -1000) then
              CYCLE
            end if
            raw_data(A,B) = 1
          end do
        end if
      end do
    end do
    ! Act by ((1,2)(0,1))
    do i = -1000,1000
      do j = -1000,1000
        if (raw_data(i,j)>0) then
          B = j
          do x = -100,100
            A = i + 6*x*j
            if (A > 1000 .OR. A < -1000) then
              CYCLE
            end if
            raw_data(A,B) = 1
          end do
        end if
      end do
    end do
    print *,"Finished round ",z
  end do


  do i = x0,x1
    do j = y0,y1
      rare_data(i,j) = raw_data(i,j)
    end do
  end do

!  x0 = -166
!  x1 = 166
!  y0 = -166
!  y1 = 166
!
!  do i = x0,x1
!    do j = x0,x1
!      rare_data(i,j) = raw_data(6*i,6*j + 1)
!    end do
!  end do


  open(7,file="rawdata.bin",form="unformatted",access="sequential")
  write(7) x0,x1,y0,y1
  write(7) rare_data
  close(7)
end program collectpoints
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

