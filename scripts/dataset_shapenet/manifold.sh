source dataset_shapenet/config.sh
# Make output directories
mkdir -p $BUILD_PATH

# Run build
for c in ${CLASSES[@]}; do

  build_path_c=$BUILD_PATH/$c
  FILES=$build_path_c/1_scaled/*
  echo "Create watertight meshes"
  for file in $FILES; do
    fname="${file##*/}"
#    echo ${fname%.*}.off
    /home/raphael/cpp/ManifoldPlus/build/manifold --input $file --output $build_path_c/3_watertight_obj/${fname%.*}.obj
  done
done