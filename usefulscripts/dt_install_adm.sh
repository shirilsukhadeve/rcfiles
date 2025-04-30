hdbnsutil -reconfig --hostnameResolution=global
export SAPMNT=/hana/shared
export SID=HDT
$SAPMNT/$SID/es/hdblcm/esaddhost.sh -master -host `hostname` -log_dir $SAPMNT/$SID/es/log/
hdbnsutil -addHostRoles --role=extended_storage_worker

mkdir /usr/sap/HDT/SYS/global/hdb/log_es
mkdir /usr/sap/HDT/SYS/global/hdb/data_es
