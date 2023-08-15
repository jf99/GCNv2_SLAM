SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

echo "Configuring and building Thirdparty/DBoW2 ..."
cd Thirdparty/DBoW2
mkdir build
cd build
cmake .. -DCMAKE_BUILD_TYPE=Release
"$SCRIPT_DIR/unlink-eigen.sh"
make -j4

cd ../../g2o

echo "Configuring and building Thirdparty/g2o ..."
mkdir build
cd build
cmake .. -DCMAKE_BUILD_TYPE=Release
"$SCRIPT_DIR/unlink-eigen.sh"
make -j4

cd ../../../

echo "Configuring and building ORB_SLAM2 ..."
cd Vocabulary
tar -xjf voc.tar.bz2
cd ..

mkdir build
cd build
cmake .. -DCMAKE_BUILD_TYPE=Release -DTORCH_PATH=/home/t/Workspace/deps/pytorch/torch/share/cmake/Torch
"$SCRIPT_DIR/unlink-eigen.sh"
make -j4
