input_file=$1
output_file=$2
initial_encoding=$(file -i $input_file | awk -F'[=]' '{print $2}')
iconv -f $initial_encoding -t UTF-8 < $input_file > $output_file	
#sed -i '$ d' $output_file # erase duplicated rows
#sed -i '3423d' $output_file # erase duplicated rows

output_file_zeros=$output_file.tsv
cp $output_file $output_file_zeros
sed -i "s/,,/,0,/g" $output_file_zeros
sed -i "s/,,/,0,/g" $output_file_zeros

sed -ie  's/,\([0-9]\)\([0-9]\)\([0-9]\)\"/\1\2\3\"/g' $output_file_zeros # Bye colon before 3 digits
sed -ie  's/,\([[:space:]]\)\([[:alpha:]]\)/\1\2/g' $output_file_zeros # Bye colob netween names
sed -ie 's/,/\t/g' $output_file_zeros # csv to tab separate values

sed -ie  's/\([0-9]\) \([0-9]\)/\1_\2/g' $output_file_zeros # Substitute spaces by underscore for the municipalities codes
sed -ie  's/\"//g' $output_file_zeros # Erasing all the quotes

sed  "/-/d" $output_file_zeros > $output_file_zeros.Only_Detailed_causes_CIE10




