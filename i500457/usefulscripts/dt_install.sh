export INSTDIR=`pwd`
export SID=HDT
export PASSWORD=trextrex
export ESPATH=/area51/external_components/ES/16.1.059.11900/linuxx86_64/es
sudo $INSTDIR/hdblcm --component_dirs=$INSTDIR/client,$ESPATH --action=update --components=all -s $SID -p $PASSWORD --es_data_path=/usr/sap/$SID/SYS/global/hdb/data_es --es_log_path=/usr/sap/$SID/SYS/global/hdb/log_es --ignore 'check_signature_file'
sudo cp ~/.cfg/i500457/usefulscripts/dt_install_adm.sh /usr/sap/HDT/HDB00/

#sudo $INSTDIR/hdblcm --component_dirs=$INSTDIR/client,$ESPATH --action=update --components=all -s $SID -p $PASSWORD --es_data_path=/hana/nfs_export/$SID/SYS/global/hdb/data_es --es_log_path=/hana/nfs_export/$SID/SYS/global/hdb/log_es --ignore 'check_signature_file'

