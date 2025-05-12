# sslCertChecker

Simple SSL certificate validity checker

Recently Let's encrypt (March 2025) announced that will not anymore notify users for certificate expiration.

This inspired this simple but useful tool


## Usage

Add your domain to the `domains` variable

```bash
./sslCertChecker.sh


Certificate              | Expires On               
-------------------------| -------------------------
www.google.com           | Jul 14 08:42:34 2025 GMT 
www.cisco.com            | Mar 14 04:47:02 2026 GMT 
www.github.com           | Feb 5 23:59:59 2026 GMT  
```
