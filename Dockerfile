#FROM registry.access.redhat.com/ubi8:latest

FROM quay.io/openshift/origin-must-gather:4.7 as builder


FROM registry.access.redhat.com/ubi8-minimal:latest

RUN microdnf -y install tar gzip rsync


COPY --from=builder /usr/bin/oc /usr/bin/oc

COPY collection-scripts/* /usr/bin/ 

ENTRYPOINT /usr/bin/gather
