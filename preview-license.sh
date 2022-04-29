#!/bin/sh

# SPDX-FileCopyrightText: 2022 Agathe Porte <microjoe@microjoe.org>
#
# SPDX-License-Identifier: MIT

set -eu

if [ "$#" -ne 1 ]
then
    2>&1 echo "usage: $0 <license-id>"
    exit 1
fi

if [ -z "$(ls -A license-list-data/)" ]
then
    2>&1 echo "please init and update license-list-data/ submodule first"
    exit 1
fi

LICENSE="$1"
DETAILS=$(jq '.' "license-list-data/json/details/$LICENSE.json")

printf '%s' "$DETAILS" | jq -r '.licenseText' | sed 's/\\n/\n/g'