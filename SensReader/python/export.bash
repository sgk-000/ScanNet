#! /bin/bash
#conda activate scannet_export

DATA_ROOT='/media/digital/samsung_4t/scannet'
files=($(find $DATA_ROOT -type f | grep .sens))
for file in "${files[@]}"; do
    filename=$(echo $file | rev | cut -d'/' -f 1 | rev)
    path=$(echo $file | sed -e "s/$filename//g")
    echo $filename;
    echo $path;
    sudo python reader.py --filename $file --output_path $path
done
