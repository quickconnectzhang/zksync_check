#!/bin/bash

mapfile -t ADDRESSES < zksync.txt


for ADDRESS in "${ADDRESSES[@]}"
do
  RESPONSE=$(curl -s "https://api.zknation.io/eligibility?id=${ADDRESS}" \
    -H 'accept: */*' \
    -H 'accept-language: zh-TW,zh;q=0.9,en-US;q=0.8,en;q=0.7,zh-CN;q=0.6,ay;q=0.5' \
    -H 'cache-control: no-cache' \
    -H 'content-type: application/json' \
    -H 'origin: https://claim.zknation.io' \
    -H 'pragma: no-cache' \
    -H 'priority: u=1, i' \
    -H 'referer: https://claim.zknation.io/' \
    -H 'sec-ch-ua: "Google Chrome";v="125", "Chromium";v="125", "Not.A/Brand";v="24"' \
    -H 'sec-ch-ua-mobile: ?0' \
    -H 'sec-ch-ua-platform: "macOS"' \
    -H 'sec-fetch-dest: empty' \
    -H 'sec-fetch-mode: cors' \
    -H 'sec-fetch-site: same-site' \
    -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36' \
    -H 'x-api-key: 46001d8f026d4a5bb85b33530120cd38')

  if [[ "$RESPONSE" != '{"allocations":[]}' ]]; then
    echo "Address with response: $ADDRESS"
  fi
done
