#!/bin/bash

: ' Este script descarga la información del dataset con menor resolución espacial (0.25°X0.25°), esta información está tanto en EMCFW y ERA

python -m motuclient --motu http://my.cmems-du.eu/motu-web/Motu --service-id SEALEVEL_GLO_PHY_CLIMATE_L4_REP_OBSERVATIONS_008_057-TDS --product-id dataset-duacs-rep-global-merged-twosat-phy-l4 --longitude-min -120 --longitude-max -74 --latitude-min -3 --latitude-max 8 --date-min "1993-01-01 00:00:00" --date-max "1994-01-01 00:00:00" --variable sla --variable adt --variable ugos --variable vgos --variable ugosa --variable vgosa --variable err --out-dir <OUTPUT_DIRECTORY> --out-name <OUTPUT_FILENAME> --user <USERNAME> --pwd <PASSWORD>'

cd 

source my_projects_dir/entorno_jup/bin/activate

#!/bin/bash
CMEMS_USERNAME='fayala'
CMEMS_PWD='J723eXx2oK_'
ENDING_DATE="1993-12-25"

a=$(date --date "2018-01-01 10:00:00" +"%F %H")

OUTPUT_DIRECTORY="/home/franklin/Documentos/GitHub/TDG/Dataset/CMEMS_ECMFW"
FILENAME="SLA"

base=1993
for i in {0..26..1} ; do

    ini_data=$(date +"%F %T" --date "$a + $i years")
    fin_data=$(date +"%F %T" --date "$a + $i years +1 years")
    
    year_ant=`expr $base + $i`
    year_sig=`expr $base + $i + 1`

    echo $year_ant "--" $year_sig

    python -m motuclient -u $CMEMS_USERNAME -p $CMEMS_PWD \
    -m "http://my.cmems-du.eu/motu-web/Motu" \
    -s SEALEVEL_GLO_PHY_CLIMATE_L4_REP_OBSERVATIONS_008_057-TDS \
    -d dataset-duacs-rep-global-merged-twosat-phy-l4 -x -120 -X -74 -y -3 -Y 8 \
    --variable sla --variable adt --variable ugos --variable vgos --variable ugosa --variable vgosa \
    -t $ini_data -T $fin_data -o $OUTPUT_DIRECTORY -f "$FILENAME"_"$year_ant".nc
    sleep 10
done

