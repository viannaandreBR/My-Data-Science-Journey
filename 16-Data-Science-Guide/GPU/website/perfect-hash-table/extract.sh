 grep 'href="https://github.com/tpn/tracer/blob' index.html |
    grep -v master |
    sed -e 's/.*blob\///' -e 's/".*//'
