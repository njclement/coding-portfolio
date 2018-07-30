for i in *.bmp
do
  j=$(echo "$i" | sed "s/\.bmp$//")
  echo "$i"
  echo "$j.png"
  convert "$i" "$j.png"
  rm "$i"
done
