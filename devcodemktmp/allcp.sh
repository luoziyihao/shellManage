for i in   `find $1 -type f `
do
    cp -rf "$i" "$2"
done
