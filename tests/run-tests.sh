#!/bin/bash
#
# Copyright 2022 SUSE, LLC.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

set -x

./s3gw-smoke-test.sh 127.0.0.1:7480 || exit 1

if [[ ! -d "./venv" ]]; then
  python3 -m venv venv || exit 1
fi

source venv/bin/activate
pip install -r ./requirements.txt || exit 1

python3 -m unittest test-*.py || exit 1
