# set default_java_mem_opts
case $MEMORY_SIZE in
    "micro")
       export JAVA_OPTS="-Xms90m -Xmx90m -Xss512k  -XX:MaxDirectMemorySize=12M"
       echo "Optimizing java process for 128M Memory...." >&2
       ;;
    "small")
       export JAVA_OPTS="-Xms180m -Xmx180m -Xss512k -XX:MaxDirectMemorySize=24M "
       echo "Optimizing java process for 256M Memory...." >&2
       ;;
    "medium")
       export JAVA_OPTS="-Xms360m -Xmx360m -Xss512k -XX:MaxDirectMemorySize=48M"
       echo "Optimizing java process for 512M Memory...." >&2
       ;;
    "large")
       export JAVA_OPTS="-Xms720m -Xmx720m -Xss512k -XX:MaxDirectMemorySize=96M "
       echo "Optimizing java process for 1G Memory...." >&2
       ;;
    "2xlarge")
       export JAVA_OPTS="-Xms1420m -Xmx1420m -Xss512k -XX:MaxDirectMemorySize=192M"
       echo "Optimizing java process for 2G Memory...." >&2
       ;;
    "4xlarge")
       export JAVA_OPTS="-Xms2840m -Xmx2840m -Xss512k -XX:MaxDirectMemorySize=384M "
       echo "Optimizing java process for 4G Memory...." >&2
       ;;
    "8xlarge")
       export JAVA_OPTS="-Xms5680m -Xmx5680m -Xss512k -XX:MaxDirectMemorySize=768M"
       echo "Optimizing java process for 8G Memory...." >&2
       ;;
    16xlarge|32xlarge|64xlarge)
       export JAVA_OPTS="-Xms8G -Xmx8G -Xss512k -XX:MaxDirectMemorySize=1536M"
       echo "Optimizing java process for biger Memory...." >&2
       ;;
    *)
       export JAVA_OPTS="-Xms512m -Xmx512m -Xss512k -XX:MaxDirectMemorySize=24M"
       echo "MEMORY_SIZE environment variable is not set, use the default memory settings" >&2
       ;;
esac
