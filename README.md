Simple HTTP Proxy Setup Script

This script automates the process of setting up a Squid-based HTTP proxy with user:pass authentication. 

Usage:

1. `git clone https://github.com/Zweak/squid-proxy`
2. `cd squid-proxy/ && bash <desired_script>`
3. Enter proxy details (space seperated)

Note:
- The script assumes that you have a Debian-based Linux distribution.
- The is no exception-handling whatsoever. If you pass in invalid ports or arguments, it won't work.
- Tested on DigitalOcean only.

