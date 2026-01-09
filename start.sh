#!/bin/bash

echo "Starting Web Terminal..."

ttyd \
  --writable \
  --port 10000 \
  --interface 0.0.0.0 \
  /bin/bash
