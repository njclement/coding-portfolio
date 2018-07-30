program countstuff
  implicit none
  integer(kind = 16), dimension(0:10000,0:10000) :: choose
  integer(kind = 16), dimension(1:10000) :: R, B
  integer(kind = 16), dimension(1:10000,1:10) :: A, C
  integer(kind = 16) :: i, j, n, pow, k
  integer(kind = 16) :: P
  P = 10**9 + 7
  print *,P
  do i = 0, 10000
    choose(i,0) = 1
    choose(i,i) = 1
  end do

  ! Generate a table of binomial coefficients
  do i = 2, 10000
    do j = 1, (i - 1)
      choose(i, j) = modulo(choose((i - 1), j) + choose((i - 1), (j - 1)), P)
    end do
  end do
  print *,"Generated binomial coefficients"
  print *,choose(100,10)

  ! Generate the function R
  R(1) = 1
  pow = 2
  do n = 2, 10000
    pow = modulo(pow*pow, P)
    R(n) = modulo((R(n - 1)+1)*pow - 1, P)
  end do
  print *,"Generated R(n)"

  ! Generate the function B
  B(1) = 1
  do n = 2, 10000
    B(n) = R(n)
    do i = 1, (n - 1)
      B(n) = modulo(B(n) - choose(n, i)*B(i), P)
    end do
  end do
  print *,"Generated B(n)"

  ! Generate the function A
  A(1,1) = 1
  do n = 2, 10000
    A(n, 1) = B(n)
    do i = 1, (n - 1)
      A(n, 1) = modulo(A(n, 1) - A(i,1)*choose(n - 1,i - 1)*B(n - i), P)
    end do
  end do
  do n = 2, 10000
    if (n <= 10) then
      A(n,n) = 1
    end if
    if (modulo(n,100) == 0) then
      print *,n
    end if
    do k = 2, (n - 1)
      if (k > 10) then 
        EXIT
      end if
      A(n, k) = A(n - 1, k - 1)
      do i = 2, (n - k + 1)
        A(n, k) = modulo(A(n, k) + choose(n - 1, i - 1)*A(i,1)*A(n-i,k-1),P)
      end do
    end do
  end do
  print *,"Generated A(n,k)"

  ! Generate the function C
  do n = 1, 10000
    if (n <= 10) then
      C(n,n) = 1
    end if
    if (modulo(n,100) == 0) then
      print *,n
    end if
    do k = 1, n - 1
      if (k > 10) then
        EXIT
      end if
      C(n, k) = A(n, k)
      do i = 1, n - k
        C(n, k) = modulo(C(n, k) + choose(n,i)*A(n-i,k), P)
      end do
    end do
  end do
  print *,"Generated C(n,k)"
  print *,C(2,1),C(3,1),C(4,2),C(100,10),C(10000,10)
end program countstuff








