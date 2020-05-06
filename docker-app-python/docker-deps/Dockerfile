# Author: Jacob Bishop

# args from --build-arg
ARG     BASE_IMAGE_NAME
ARG     BASE_IMAGE_VERSION

# base
FROM    $BASE_IMAGE_NAME:$BASE_IMAGE_VERSION

# additional packages from local, can be placed to another image
#RUN     pip install -U qi.common==0.4.6
#RUN     pip install -U qi.data==0.4.8
#RUN     pip install -U qi.utils==0.6.41
#RUN     pip install -U qi.tool==0.2.14

RUN     pip install -r requirements.txt
