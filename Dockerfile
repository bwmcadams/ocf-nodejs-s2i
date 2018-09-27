FROM bucharestgold/centos7-s2i-nodejs

MAINTAINER Brendan McAdams <bmcadams@redhat.com>

# TODO: Rename the builder environment variable to inform users about application you provide them
ENV OCF_NODE_VERSION=0.1

LABEL io.k8s.description="Runtime image for running OCF Node applications" \
      io.k8s.display-name="OCF Node 0.1.0" \
      io.openshift.expose-services="8080:http" \
      io.openshift.tags="ocf,node,functions"

# TODO: Install required packages here:
# RUN yum install -y ... && yum clean all -y

# TODO (optional): Copy the builder files into /opt/app-root
# COPY ./<builder_folder>/ /opt/app-root/

# TODO: Copy the S2I scripts to /usr/libexec/s2i, since openshift/base-centos7 image
# sets io.openshift.s2i.scripts-url label that way, or update that label
COPY ./s2i/bin/ /usr/libexec/s2i

# TODO: Drop the root user and make the content of /opt/app-root owned by user 1001
# RUN chown -R 1001:1001 /opt/app-root

# This default user is created in the openshift/base-centos7 image
USER 1001

EXPOSE 8080

CMD ${STI_SCRIPTS_PATH}/usage
