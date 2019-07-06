# This script was adapted from
#     https://lukeyeager.github.io/2018/01/22/setting-the-default-docker-runtime-to-nvidia.html
# to change default `docker` runtime to `nvidia` instead of `runc`.
# Use with your own risks.
# ================================================================

# Update the default configuration and restart
pushd $(mktemp -d)
(sudo cat /etc/docker/daemon.json 2>/dev/null || echo '{}') | \
    jq '. + {"default-runtime": "nvidia"}' | \
    tee tmp.json
sudo mv tmp.json /etc/docker/daemon.json
popd
sudo systemctl restart docker
