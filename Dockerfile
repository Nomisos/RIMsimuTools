FROM ubuntu:22.04

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update \
    && apt-get install less \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get clean
ADD install.sh install.sh
RUN sh ./install.sh && rm install.sh
RUN useradd -ms /bin/bash octave
COPY . /home/octave/
RUN chown -R octave:octave /home/octave/

USER octave
WORKDIR /home/octave

VOLUME ["/source"]
#RUN octave  addpath(genpath('.'))
#ENTRYPOINT ["/bin/bash",  "octave-cli --eval test_start "]
#ENTRYPOINT ["/bin/bash"]
ENTRYPOINT octave-cli --eval test_start

