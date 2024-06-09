#!/usr/bin/env bash
#
# Licensed to the Apache Software Foundation (ASF) under one
# or more contributor license agreements.  See the NOTICE file
# distributed with this work for additional information
# regarding copyright ownership.  The ASF licenses this file
# to you under the Apache License, Version 2.0 (the
# "License"); you may not use this file except in compliance
# with the License.  You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing,
# software distributed under the License is distributed on an
# "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
# KIND, either express or implied.  See the License for the
# specific language governing permissions and limitations
# under the License.

set -eux

df -h
echo "::group::/usr/local/*"
du -hsc /usr/local/* || echo
echo "::endgroup::"
# ~1GB
rm -rf \
  /usr/local/aws-sam-cil \
  /usr/local/julia* || :
echo "::group::/usr/local/bin/*"
du -hsc /usr/local/bin/* || echo
echo "::endgroup::"
# ~1GB (From 1.2GB to 214MB)
rm -rf \
  /usr/local/bin/aliyun \
  /usr/local/bin/azcopy \
  /usr/local/bin/bicep \
  /usr/local/bin/cmake-gui \
  /usr/local/bin/cpack \
  /usr/local/bin/helm \
  /usr/local/bin/hub \
  /usr/local/bin/kubectl \
  /usr/local/bin/minikube \
  /usr/local/bin/node \
  /usr/local/bin/packer \
  /usr/local/bin/pulumi* \
  /usr/local/bin/sam \
  /usr/local/bin/stack \
  /usr/local/bin/terraform || :
# 142M
rm -rf /usr/local/bin/oc || : \
echo "::group::/usr/local/share/*"
du -hsc /usr/local/share/* || echo
echo "::endgroup::"
# 506MB
rm -rf /usr/local/share/chromium || :
# 1.3GB
rm -rf /usr/local/share/powershell || :
echo "::group::/usr/local/lib/*"
du -hsc /usr/local/lib/* || echo
echo "::endgroup::"
# 15GB
rm -rf /usr/local/lib/android || :
# 341MB
rm -rf /usr/local/lib/heroku || :
# 1.2GB
rm -rf /usr/local/lib/node_modules || :
echo "::group::/opt/*"
du -hsc /opt/* || echo
echo "::endgroup::"
# 679MB
rm -rf /opt/az || :
echo "::group::/opt/microsoft/*"
du -hsc /opt/microsoft/* || echo
echo "::endgroup::"
# 197MB
rm -rf /opt/microsoft/powershell || :
echo "::group::/opt/hostedtoolcache/*"
du -hsc /opt/hostedtoolcache/* || echo
echo "::endgroup::"
# 5.3GB
rm -rf /opt/hostedtoolcache/CodeQL || :
# 1.4GB
rm -rf /opt/hostedtoolcache/go || :
# 489MB
rm -rf /opt/hostedtoolcache/PyPy || :
# 376MB
rm -rf /opt/hostedtoolcache/node || :
# Remove Web browser packages
apt purge -y \
  firefox \
  google-chrome-stable \
  microsoft-edge-stable
df -h
