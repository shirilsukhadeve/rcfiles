import psutil
import subprocess
def getIndexserverPID():
    process_name = "hdbindexserver"
    pid = []
    for proc in psutil.process_iter(attrs=None, ad_value=None):
        if process_name in proc.name():
            pid.append(proc.pid)
    return (pid)
def memory_usage_psutil(pid):
    out = subprocess.Popen(['ps', 'v', '-p', str(pid)],
    stdout=subprocess.PIPE).communicate()[0].split(b'\n')
    vsz_index = out[0].split().index(b'RSS')
    mem = float(out[1].split()[vsz_index]) / (1024*1024)
    return (mem)

if __name__ == '__main__':
    pid = getIndexserverPID()
    print ("hdbindexserver :::",pid )
    if len(pid)>0:
        maxMemoryUtilisation = dict.fromkeys(pid,0)
        try:
            while (True):
                for indexserverpid in pid:
                    memoryUtilisation = memory_usage_psutil(indexserverpid)
                    if (memoryUtilisation > maxMemoryUtilisation.get(indexserverpid)):
                        maxMemoryUtilisation[indexserverpid] = memoryUtilisation
        except:
            print ("Some index servers are either killed or stopped closing the script now")
        finally:
            print ("This is the process and the max memory utilisation:",maxMemoryUtilisation)

