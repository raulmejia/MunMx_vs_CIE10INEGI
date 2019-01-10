input_file=../Data/INEGI_Mortalidad_2010/Mortalidad_2010_completo.csv
output_file=../Data/INEGI_Mortalidad_2010/Mortalidad_2010_completo.csv.UTF8
initial_encoding=$(file -i $input_file | awk -F'[=]' '{print $2}')
iconv -f $initial_encoding -t UTF-8 < $input_file > $output_file	
sed -i '$ d' $output_file # erase duplicated rows
sed -i '3423d' $output_file # erase duplicated rows


output_file_zeros="../Data/INEGI_Mortalidad_2010/Mor2010_UTF8_imputed_zeros.csv"
cp $output_file $output_file_zeros
sed -i "s/,,/,0,/g" $output_file_zeros
sed -i "s/,,/,0,/g" $output_file_zeros

# iconv -f iso-8859-1 -t UTF-8 < $input_file > $output_file

file_zeros_tsv="../Data/INEGI_Mortalidad_2010/Mor2010_UTF8_imputed_zeros.tsv"
Rscript libraries/csv2tsv.R $output_file_zeros $file_zeros_tsv

sed -i "s/,//g" $file_zeros_tsv
sed -i "s/NA/0/g" $file_zeros_tsv


Detailed_causes_CIE10="../Data/INEGI_Mortalidad_2010/Mor2010_UTF8_imputed_zeros_Detailed_causes_CIE10.tsv"
cp $file_zeros_tsv $Detailed_causes_CIE10
sed -i "/-/d" $Detailed_causes_CIE10

#out_tsv="../Data/INEGI_Mortalidad_2010/Mortalidad_2010_completo.UTF8.tsv"
#sed 's/, / /g'  < $output_file_zeros > $out_tsv
#sed -i "s/,/\t/g" $out_tsv
#sed -i 's/"//g' $out_tsv



