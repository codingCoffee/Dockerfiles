FROM python:alpine


MAINTAINER Ameya Shenoy <shenoy.ameya@gmail.com>

ENV LANG=C.UTF-8 \
    OPENCV_VERSION=4.1.1 \
    CC=/usr/bin/clang \
    CXX=/usr/bin/clang++

RUN set -ex \
  && apk add --no-cache \
    ffmpeg-dev \
    libdc1394 \
    libstdc++ \
    libjpeg-turbo \
    libwebp \
    openblas \
    openjpeg \
    tiff \
  && apk add --no-cache --virtual .build-deps \
    build-base \
    ca-certificates \
    clang-dev \
    cmake \
    coreutils \
    curl \
    ffmpeg-libs \
    freetype-dev \
    g++ \
    gcc \
    gettext \
    git \
    jasper-libs \
    libdc1394-dev \
    libjpeg-turbo-dev \
    libpng-dev \
    jpeg-dev \
    lcms2-dev \
    libavc1394-dev \
    libc-dev \
    libffi-dev \
    libgcc \
    libressl-dev \
    libwebp-dev \
    libxml2-dev \
    libxslt-dev \
    linux-headers \
    make \
    musl-dev \
    ninja \
    openblas-dev \
    openjpeg-dev \
    openssl-dev \
    pkgconfig \
    python3-dev \
    texlive \
    tesseract-ocr \
    tiff-dev \
    unzip \
    zlib-dev \
  && pip install --upgrade \
    pip \
    imutils \
    numpy \
    scipy \
    Pillow \
    pytesseract \
  && cd /opt \
  && wget https://github.com/opencv/opencv/archive/${OPENCV_VERSION}.zip \
  && unzip ${OPENCV_VERSION}.zip \
  && rm ${OPENCV_VERSION}.zip \
  && wget https://github.com/opencv/opencv_contrib/archive/${OPENCV_VERSION}.zip \
  && unzip ${OPENCV_VERSION}.zip \
  && rm ${OPENCV_VERSION}.zip \
  && cd opencv-${OPENCV_VERSION} \
  && mkdir build \
  && cd build \
  && cmake \
    -D CMAKE_BUILD_TYPE=Release \
    -D CMAKE_C_COMPILER=/usr/bin/clang \
    -D CMAKE_CXX_COMPILER=/usr/bin/clang++ \
    -D CMAKE_INSTALL_PREFIX=/usr/local \
    -D INSTALL_PYTHON_EXAMPLES=OFF \
    -D INSTALL_C_EXAMPLES=OFF \
    -D WITH_FFMPEG=ON \
    -D WITH_TBB=ON \
    -D PYTHON_EXECUTABLE=/usr/local/bin/python \
    -D WITH_IPP=NO \
    -D WITH_OPENEXR=NO \
    -D BUILD_EXAMPLES=NO \
    -D BUILD_ANDROID_EXAMPLES=NO \
    -D BUILD_DOCS=NO \
    -D BUILD_opencv_python2=NO \
    -D BUILD_opencv_python3=ON \
    -D PYTHON3_EXECUTABLE=/usr/local/bin/python \
    -D PYTHON3_INCLUDE_DIR=/usr/local/include/python3.7m/ \
    -D PYTHON3_LIBRARY=/usr/local/lib/libpython3.so \
    -D PYTHON_LIBRARY=/usr/local/lib/libpython3.so \
    -D PYTHON3_PACKAGES_PATH=/usr/local/lib/python3.7/site-packages/ \
    -D PYTHON3_NUMPY_INCLUDE_DIRS=/usr/local/lib/python3.7/site-packages/numpy/core/include/ \
    -D OPENCV_EXTRA_MODULES_PATH=/opt/opencv_contrib-${OPENCV_VERSION}/modules \
    .. \
  && make VERBOSE=1 -j$(nproc) \
  && make -j$(nproc) \
  && make install \
  && cd \
  && rm -rf /opt/opencv-${OPENCV_VERSION} /opt/opencv_contrib-${OPENCV_VERSION} \
  && apk del .build-deps \
  && rm -rf /var/cache/apk/*

