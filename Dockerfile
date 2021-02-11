FROM ubuntu:20.04

LABEL maintainer="Nokita Kaze <admin@kanaria.ru>"

RUN apt-get update && \
    apt-get install --yes --no-install-recommends wget ca-certificates strace && \
    wget https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb -O 'packages-microsoft-prod.deb' && \
    dpkg -i packages-microsoft-prod.deb && \
    rm packages-microsoft-prod.deb && \
    apt-get update && \
    apt-get install --yes --no-install-recommends dotnet-sdk-3.1

# RUN apt-get install --yes --no-install-recommends net-tools mc telnet

RUN wget 'https://nktkz.s3.eu-central-1.amazonaws.com/development/github/docker-pvs-studio/pvs-studio-7.09.42228.74-amd64.deb' -O 'pvs-studio-7.09.42228.74-amd64.deb' && \
    wget 'https://nktkz.s3.eu-central-1.amazonaws.com/development/github/docker-pvs-studio/pvs-studio-dotnet-7.09.41435.312-amd64.deb' -O 'pvs-studio-dotnet-7.09.41435.312-amd64.deb' && \
    dpkg -i pvs-studio-7.09.42228.74-amd64.deb && \
    dpkg -i pvs-studio-dotnet-7.09.41435.312-amd64.deb && \
    rm pvs-studio-7.09.42228.74-amd64.deb pvs-studio-dotnet-7.09.41435.312-amd64.deb

CMD exec /bin/bash -c "cd /var/run/files/ && dotnet restore && pvs-studio-dotnet -t /var/run/files/Input.sln -c Release --progress"

# CMD exec /bin/bash -c "trap : TERM INT; sleep infinity & wait"
