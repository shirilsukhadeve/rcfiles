import sys
import os
from fastavro import reader

def usage():
    print("Usage: python print_manifest.py <manifest-file.avro>")

# Check for input argument
if len(sys.argv) < 2:
    usage()
    sys.exit(1)

filename = sys.argv[1]

# Validate file exists
if not os.path.isfile(filename):
    print(f"Error: File '{filename}' does not exist.")
    sys.exit(1)

# Read and print Avro records
print(f"Reading manifest file: {filename}")
try:
    with open(filename, 'rb') as f:
        avro_reader = reader(f)
        print("==== Manifest Records ====")
        for i, record in enumerate(avro_reader):
            print(f"\n--- Record {i+1} ---")
            for k, v in record.items():
                print(f"{k}: {v}")
except Exception as e:
    print(f"Failed to read manifest file: {e}")
    sys.exit(1)
