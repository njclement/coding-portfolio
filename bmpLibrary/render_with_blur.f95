program render
  implicit none
  integer(8) :: x0, x1, y0, y1, margin, i, j, v,c
  integer, allocatable, dimension(:,:,:) :: pre_rgbValues
  byte, allocatable, dimension(:,:,:) :: rgbValues
  integer, allocatable, dimension(:,:) :: raw_data
  integer, dimension(3) :: shoop
  
  margin = 100

  open(7,file="rawdata.bin",form="unformatted",access="sequential")
  read(7) x0, x1, y0, y1
  print *,x0,x1,y0,y1
  allocate( raw_data(x0:x1, y0:y1) )
  read(7) raw_data
  close(7)

  allocate( rgbValues(1:4,x0-margin:x1+margin,y0-margin:y1+margin) )
  allocate( pre_rgbValues(1:4,x0-margin:x1+margin,y0-margin:y1+margin) )
  do i = x0, x1
    do j = y0, y1
      v = raw_data(i,j)*50
      pre_rgbValues(2,i,j) = 5*v + pre_rgbValues(2,i,j)
      pre_rgbValues(2,i-1,j) = 2*v + pre_rgbValues(2,i-1,j)
      pre_rgbValues(2,i+1,j) = 2*v + pre_rgbValues(2,i+1,j)
      pre_rgbValues(2,i,j-1) = 2*v + pre_rgbValues(2,i,j-1)
      pre_rgbValues(2,i,j+1) = 2*v + pre_rgbValues(2,i,j+1)
    end do
  end do
  do i = x0, x1
    do j = y0, y1
      do c = 1,4
        v = pre_rgbValues(c,i,j)
        if (v>255) then
          v = 255
        end if
        rgbValues(c,i,j) = v
      end do
    end do
  end do
  v=255
  rgbValues(3,0,0) = v

  shoop = shape(rgbValues)
  call bmp_header("drawing.bmp",shoop(2),shoop(3))

  open(9,file="drawing.bmp",form="unformatted",access="stream",status="old")
  write(9,pos=55) rgbValues
  close(9)
end program render

