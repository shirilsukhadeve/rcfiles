import numpy as np
import pandas as pd
import pyarrow as pa
import pyarrow.parquet as pq
import sys
import os

def usage():
    print("usage: python3.exe printfile.py <path>")

if(len(sys.argv) < 2 ):
    usage()
    sys.exit()

filename = sys.argv[1]

metadata = pq.read_metadata(filename)
print("==== Metadata ====")
print(metadata)
for i in range(metadata.num_columns):
    col = metadata.row_group(0).column(i)
#    print("===== column "+str(i)+" ("+col.path_in_schema+") ====")
#    print("rows per rowgroup: "+str(metadata.row_group(0).num_rows))
#    if col.statistics:
#        print("Physical type: "+col.statistics.physical_type)
#        print("Logical type: "+str(col.statistics.logical_type))
#    else:
#        if col.physical_type:
#            print("Physical type: "+col.physical_type)
    print("--------col "+str(i)+"--------")
    print(col)
print("==== Data ====")
table = pq.read_table(filename)
print(table.to_pandas())
