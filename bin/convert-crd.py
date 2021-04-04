#!/usr/bin/env python3
import sys

import subprocess

import json

import re
import yaml

with open(sys.argv[1]) as y:
    original_yaml = yaml.safe_load(y)

    if original_yaml and "status" in original_yaml.keys():
        original_yaml.pop("status")

    if original_yaml and "original_yaml" in original_yaml.keys():
        resource_name = f'{original_yaml["metadata"]["name"].replace(".", "_").replace(":", "_")}_' \
                        f'{original_yaml["kind"].lower()}'

    else:
        resource_name = sys.argv[1].replace(".yaml", "")

with open(sys.argv[2], "w") as f:
    text = json.dumps(original_yaml, indent=4)
    text = text.replace('"__namespace__"', "var.operator_namespace")

    f.write(f"resource \"kubernetes_manifest\" \"{resource_name}\" {{\n\n"
            f"    provider = kubernetes-alpha\n\n"
            f"    manifest = {text}\n\n"
            f"}}")

if subprocess.call(["tflint", sys.argv[2]]) > 0:
    print("tflint failed, aborting")
