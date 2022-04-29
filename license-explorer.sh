#!/bin/sh

# SPDX-FileCopyrightText: 2022 Agathe Porte <microjoe@microjoe.org>
#
# SPDX-License-Identifier: MIT

set -eu

if [ -z "$(ls -A license-list-data/)" ]
then
    2>&1 echo "please init and update license-list-data/ submodule first"
    exit 1
fi

jq -r '.licenses[] | .licenseId' license-list-data/json/licenses.json | fzf --preview './preview-license.sh {}'
