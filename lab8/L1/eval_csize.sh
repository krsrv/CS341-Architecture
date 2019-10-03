echo "" > output;

for i in {1..6};
do
  echo "#define CACHE_SIZE $((1<<$i))" > test.c;
  cat cache_size.c >> test.c;

  gcc test.c -o test
  echo "Cache size parameter: $((1<<$i))" >> output;

  for j in {1..5};
  do
	./test >> output;
	echo "" >> output;
  done
done
