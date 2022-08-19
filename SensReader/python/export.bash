#! /bin/bash

DATA_ROOT='/media/digital/samsung_4t/scannet'
files=($(find $DATA_ROOT -type f | grep .sens))
arr=()
for file in "${files[@]}"; do
    filename=$(echo $file | rev | cut -d'/' -f 1 | rev)
    path=$(echo $file | sed -e "s/$filename//g")
    arr+=($file $path)
done
echo ${arr[@]} | xargs -n 2 | parallel --progress -u --colsep ' ' --no-notice -- sudo python reader.py --export_depth_images --export_color_images --export_poses --export_intrinsics --filename {1} --output_path {2}