BEGIN { OFS = "\t"; n = 4 }  # n = desired number of columns
{
  col = (NR - 1) % n
  row = int((NR - 1) / n)
  data[row, col] = $1 # store values in a table
}
END {
  if (NR % n != 0) {
    print "Error: number of input lines (" NR ") is not divisible by n (" n ")." > "/dev/stderr"
    exit 1
  }
  
  max_row = NR / n
  for (r = 0; r <= max_row; r++) {
    for (c = 0; c < n; c++) {
      printf "%s%s", (c ? OFS : ""), data[r, c] # print \t + value if not first column
    }
    print ""
  }
}
