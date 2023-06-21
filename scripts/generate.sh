#!/bin/bash
set -euo pipefail

flutter pub run build_runner build --delete-conflicting-outputs
