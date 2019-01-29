#FROM docker-registry.default.svc:5000/base/jupyter-image:5.5
FROM docker.io/majordomusio/jupyter-container:5.5

# Default user ID
ENV USER_ID 1001

# Image metadata
ENV NAME="stufff-ml/notebook-ml" \
    SUMMARY="Generic ML/AI Jupyther notebook project"	\
    DESCRIPTION="Generic ML/AI Jupyther notebook project" \
    MAINTAINER="Stufff ML <hello@ratchet.cc>" \
    VENDOR="stufff-ml" \
    TAGS="fedora python jupyter" \
    VERSION="5" \
    RELEASE="5"

LABEL name="$NAME" \
      maintainer="$MAINTAINER" \
      vendor="$VENDOR" \
      version="$VERSION" \
      release="$RELEASE" \
      summary="$SUMMARY" \
      description="$DESCRIPTION" \
      io.k8s.description="DESCRIPTION" \
      io.k8s.display-name="$NAME" \
      io.openshift.tags="$TAGS"

# Jupyter environment
ENV JUPYTER_CONFIG_DIR=$APP_ROOT/config \
    JUPYTER_DATA_DIR=$APP_ROOT/data \
    JUPYTER_EXTRA_PKGS="blas lapack" \
    DISABLE_JUPYTER_EXTRA_PKGS="false" \
    JUPYTER_ARGS="" \
    JUPYTER_CMD="notebook" \
    PIP_ARGS=""

# The default location
EXPOSE 8080
WORKDIR ${APP_ROOT}

# Copy extra files to the image.
COPY ./root/ /

# Build the image
RUN /usr/bin/assemble-jupyter
RUN chown -R ${USER_ID}:0 ${APP_ROOT}/* && chmod -R a+rwx ${APP_ROOT}/* && fix-permissions ${APP_ROOT} -P

# Volume for notebook data
VOLUME ["$APP_ROOT/data"]

# Drop the root user
USER ${USER_ID}

# Set the default run CMD
CMD ["start-jupyter"]
