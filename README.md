# deploy gsnova to heroku [![Deploy](https://www.herokucdn.com/deploy/button.png)](https://heroku.com/deploy?template=https://github.com/wangyi2005/gsnova-heroku)

# deploy gsnova-paas to openshift starter

gsnova-paas ver 0.34.0

image: miaomiaosoft/gsnova-paas，wangyi2005/gsnova-paas:#.##.#

# 1.websocket

ServerList: wss://##########.7e14.starter-us-west-2.openshiftapps.com

openshift secure route type: edge(port 8080)

# 2.http2

ServerList: http2://##########.7e14.starter-us-west-2.openshiftapps.com

openshift secure route type: passthrough(port 8088)


# 3.sniproxy setting in client.json and host.json

