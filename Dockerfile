FROM registry.access.redhat.com/ubi9-minimal:9.0.0-1580

RUN microdnf install -y \
    python3 \
    numactl-libs \
  && rpm -ivh https://kojipkgs.fedoraproject.org//packages/fio/3.29/1.fc36/x86_64/fio-3.29-1.fc36.x86_64.rpm \
  && rpm -ivh https://kojipkgs.fedoraproject.org/packages/libaio/0.3.111/13.fc36/x86_64/libaio-0.3.111-13.fc36.x86_64.rpm \
  && rpm -ivh https://kojipkgs.fedoraproject.org/packages/fio/3.29/1.fc36/x86_64/fio-engine-libaio-3.29-1.fc36.x86_64.rpm \
  && microdnf clean all

COPY jobs /jobs

ENTRYPOINT ["fio"]

