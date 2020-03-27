#!/bin/bash



:'python -m motuclient --motu http://my.cmems-du.eu/motu-web/Motu --service-id GLOBAL_REANALYSIS_PHY_001_030-TDS --product-id global-reanalysis-phy-001-030-monthly --longitude-min 130 --longitude-max -74 --latitude-min -10 --latitude-max 10 --date-min "1993-01-16 12:00:00" --date-max "2018-12-16 12:00:00" --depth-min 0.493 --depth-max 0.4942 --variable thetao --variable zos --variable uo --variable vo --out-dir <OUTPUT_DIRECTORY> --out-name <OUTPUT_FILENAME> --user <USERNAME> --pwd <PASSWORD>'

: ' Este script descarga la información del dataset con mayor resolución espacial (1/12° X 1/12°), esta información está tanto en EMCFW y ERA'

:"1. Abrir la ruta del archivo"
:"2. Escribir "

cd 
source my_projects_dir/entorno_jup/bin/activate

#!/bin/bash
CMEMS_USERNAME='fayala'
CMEMS_PWD='J723eXx2oK_'
ENDING_DATE="2018-12-25"

a=$(date --date "1993-01-01 12:00:00" +"%F %H")

OUTPUT_DIRECTORY="/home/franklin/Documentos/GitHub/TDG/Dataset/Glorys_CMEMS_Monthly"
FILENAME="SSH"

base=1993
for i in {0..6..1} ; do

    ini_data=$(date +"%F %T" --date "$a + $i years")
    fin_data=$(date +"%F %T" --date "$a + $i years +1 years")
    
    year_ant=`expr $base + $i`
    year_sig=`expr $base + $i + 1`

    echo $year_ant "--" $year_sig

    python -m motuclient -u $CMEMS_USERNAME -p $CMEMS_PWD \
    -m "http://my.cmems-du.eu/motu-web/Motu" \
    -s GLOBAL_REANALYSIS_PHY_001_030-TDS \
    -d global-reanalysis-phy-001-030-monthly -x 130 -X -74 -y -10 -Y 10 -z 0.493 -Z 0.4942 \
    --variable thetao --variable zos --variable uo --variable vo \
    -t $ini_data -T $fin_data -o $OUTPUT_DIRECTORY -f "$FILENAME"_"$year_ant".nc
    sleep 10
done

