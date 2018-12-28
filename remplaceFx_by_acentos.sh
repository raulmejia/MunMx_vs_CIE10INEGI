input_file=../Data/INEGI_Mortalidad_2010/Mortalidad_2010_completo.csv

output_file=../Data/INEGI_Mortalidad_2010/Mortalidad_2010_completo.csv.UTF8

iconv -f iso-8859-1 -t UTF-8 < $input_file > $output_file
