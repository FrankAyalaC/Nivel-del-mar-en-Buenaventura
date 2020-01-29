#!/bin/bash

cd 

: ' Este script descarga la información del dataset con mayor resolución espacial (1/12° X 1/12°), esta información está tanto en EMCFW y ERA'

source my_projects_dir/entorno_jup/bin/activate

#!/bin/bash
CMEMS_USERNAME='fayala'
CMEMS_PWD='J723eXx2oK_'
ENDING_DATE="2018-12-25"

a=$(date --date "1993-01-01 12:00:00" +"%F %H")

OUTPUT_DIRECTORY="/home/franklin/Documentos/GitHub/TDG/Dataset/Glorys_CMEMS"
FILENAME="SSH"

base=1993
for i in {0..24..1} ; do

    ini_data=$(date +"%F %T" --date "$a + $i years")
    fin_data=$(date +"%F %T" --date "$a + $i years +1 years")
    
    year_ant=`expr $base + $i`
    year_sig=`expr $base + $i + 1`

    echo $year_ant "--" $year_sig

    python -m motuclient -u $CMEMS_USERNAME -p $CMEMS_PWD \
    -m "http://my.cmems-du.eu/motu-web/Motu" \
    -s GLOBAL_REANALYSIS_PHY_001_030-TDS \
    -d global-reanalysis-phy-001-030-daily -x -120 -X -74 -y -3 -Y 8 -z 0.493 -Z 0.4942 \
    --variable thetao --variable zos --variable uo --variable vo \
    -t $ini_data -T $fin_data -o $OUTPUT_DIRECTORY -f "$FILENAME"_"$year_ant".nc
    sleep 10
done

