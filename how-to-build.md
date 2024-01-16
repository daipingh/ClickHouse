### mips64el

requires:
  - clang-17
  - cmake-3.31.3
  - ninja


```
git clone https://github.com/daipingh/ClickHouse.git
pushd ClickHouse/
git checkout 24.3-add_mips64el
git submodule update --init
git submodule foreach git reset --hard HEAD
git -C contrib/rocksdb apply `pwd`/contrib-patches/rocksdb/0001-add-mips64-support-in-toku_time.patch
popd

mkdir build-ClickHouse
pushd build-ClickHouse/
cmake ../ClickHouse \
  -DCMAKE_TOOLCHAIN_FILE=../ClickHouse/cmake/linux/toolchain-mips64.cmake \
  -DCMAKE_BUILD_TYPE=Release \
  -DENABLE_HDFS=OFF \
  -DENABLE_LDAP=OFF \
  -DENABLE_GRPC=OFF \
  -DENABLE_PROTOBUF=OFF \
  -DENABLE_PARQUET=OFF \
  -DENABLE_CLICKHOUSE_ODBC_BRIDGE=OFF \
  -DENABLE_CLICKHOUSE_LIBRARY_BRIDGE=OFF
cmake --build . --target clickhouse
cmake -E env DESTDIR=install cmake --instal .
popd
ls -al build-ClickHouse/install/usr/local/

```
