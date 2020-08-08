FROM centos:7

RUN curl -o linux_dev.tgz ftp://ftp.nga.mil/pub2/gandg/website/wgs84/apps/geotrans/current-version/sw/dev_version/linux_dev.tgz

RUN tar zxvf linux_dev.tgz

RUN yum -y install gcc
RUN yum -y install gcc-c++
RUN yum install -y make

# edit makefile to work on Docker
RUN sed -i.bak 's/-o MSPCCS_SpreadsheetTester/-pthread -o MSPCCS_SpreadsheetTester/' /geotrans3.8/SpreadsheetTester/linux_64/makefile

RUN cd /geotrans3.8/SpreadsheetTester/linux_64 && make

ENV MSPCCS_DATA /geotrans3.8/data

# run tests for every test file
RUN bash -c "for f in /geotrans3.8/SpreadsheetTester/TestFiles/inputs/*; do cd /geotrans3.8/SpreadsheetTester/linux_64 && ./MSPCCS_SpreadsheetTester \$f \$(echo \$f | sed -e 's/inputs/outputs\/output/') 1 > \$(echo \$f | sed -e 's/inputs/outputs\/screen/') ; done"
