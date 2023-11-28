
i=1;

for arquivo in *; #o * funciona como um ls 
 do

  echo "$i" - "$arquivo";
  unzip "$arquivo";

  i=$(($i+1));
done

