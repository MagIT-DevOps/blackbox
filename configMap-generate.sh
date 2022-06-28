#!/bin/bash
if [ $# == 3 ]
    then
    ytt -f $1 -f $2 > configMap-$3.yaml
    sed -i 's/^/    /' configMap-$3.yaml
    sed -i '1s/^/apiVersion: v1\nkind: ConfigMap\nmetadata:\n  name: kong-config\ndata:\n  kong.yml: \|\n    _format_version: "2.1"\n/' configMap-$3.yaml
    sed -i 's/- -/  -/' configMap-$3.yaml
    echo "file configMap.yaml created."
    else
        echo "No matched number of variables!"           
        exit 1
fi