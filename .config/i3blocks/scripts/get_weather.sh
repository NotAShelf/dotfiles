OUTPUT=`curl -Ss 'https://wttr.in/mosbach?format=%C%20%t'`
echo "${OUTPUT,,}"
