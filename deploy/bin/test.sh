webhook_url='https://hook.bearychat.com/=bw7A8/incoming/6cb5a3a71da01d9836995967e9e1651d'

curl $webhook_url -X POST \
  -d 'payload={"text":"愿原力与你同在"}'
