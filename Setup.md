

## SSH keys


### Checking SSH with Github

```
ssh -T git@github.com
```
If this just waits with no output, you can turn on verbose mode
```
ssh -vvT git@github.com
```
If this shows waiting while trying to connect to github.com, e.g.
```
OpenSSH_7.6p1, LibreSSL 2.6.2
debug1: Reading configuration data /Users/duncan/.ssh/config
debug1: /Users/duncan/.ssh/config line 15: Applying options for *github.com
debug1: Reading configuration data /etc/ssh/ssh_config
debug1: /etc/ssh/ssh_config line 48: Applying options for *
debug2: ssh_connect_direct: needpriv 0
debug1: Connecting to github.com port 22.
```
then this is a network problem. Check you are on the WiFi or have an internet
connection generally, e.g., visit and reload a page in your Web browser
(make certain it is not a cached version of the page, hence the explicit reload).
If you have internet connection, then you might be on a VPN (Virtual Private Network)
that blocks git traffic.  The UCD library VPN does that.  So get off that VPN
and then try to connect to github with
```
ssh -vvT git@github.com
```

## First Git Commit and email and Name

When you 
