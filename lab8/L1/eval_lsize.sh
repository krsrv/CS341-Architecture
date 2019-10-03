echo "" > output;

for i in {1..6};
do
  echo "#define LINE_SIZE $((1<<$i))" > test.c;
  cat line_size.c >> test.c;

  gcc test.c -o test
  echo "Line size parameter: $((1<<$i))" >> output;

  for j in {1..5};
  do
	./test >> output;
	echo "" >> output;
  done
done
