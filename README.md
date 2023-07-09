Simple HTTP Proxy Setup Script

This script automates the process of setting up a Squid-based HTTP proxy with user:pass authentication. 

Usage:

1. `chmod +x setup.sh`
2. `cd squid-proxy/ && ./setup.sh`
3. Enter desired username, password, and port (space seperated) for your Squid proxy.

Note:
- The script assumes that you have a Debian-based Linux distribution.
- The is no exception-handling whatsoever. If you pass in invalid ports or arguments, it won't work.
- Tested on DigitalOcean only.

