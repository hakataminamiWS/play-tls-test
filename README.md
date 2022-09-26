# play-tls-test
Access test with https and http2 in Play Framework 2.8.16 (with Eclipse Adoptium Java 11.0.16.1).

# Requirement
 - certificate items (certificate.crt, ca_bundle.crt and private.key) from [ZeroSSL](https://help.zerossl.com/hc/en-us/articles/360060120113-Download-Certificate) for your domain (ex. localhost.your-domain.com)

# Test
 1. copy certificate items in `docker-cert/input` folder
 1. generate jks file by ```docker-cert/convert-crt-to-jks.sh```
 1. move `docker-cert/output/certificate.jks` to `conf/certificate.jks`
 1. run with options (port, jks file path, etc.) `sbt run -Dhttps.port=9443 -Dplay.server.https.keyStore.path=conf/certificate.jks -Dplay.server.https.keyStore.type=JKS -Dplay.server.https.keyStore.password=tekitouna-pass-2`
 1. access your domain at port 9443 (ex. https://localhost.your-domain.com:9443) with https and http2

# Link
 - [Giter8 template for generating a Play project seed in Scala](https://github.com/playframework/play-scala-seed.g8)
 - [ZeroSSL](https://zerossl.com/)
 - [ローカル開発環境の https 化](https://blog.jxck.io/entries/2020-06-29/https-for-localhost.html)

# License
[Apache License 2.0](LICENSE)
