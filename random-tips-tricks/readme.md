# Some Random Tips and Tricks , tools to increase your productivity.

## sudo !!

suppose you run any command and it fail because of permission denined (bcz u did not append the sudo)

you have two option , one to go back and add sudo in front of the previous failed command

but the nice way is to use sudo bang bang

```bash
sudo !!
```

it will run the previous command with sudo privilages

## empty content of a file without opening in any edtior (from terminal)

Add > (less then to filename)

```bash
>abc.txt
```

if you want to first open in vim and see the content then remove all text

## ggdG

Total four keys in parallel (last is capital G)

## Assign password to a user in one line

## Check All open ports

```bash
nmap 192.168.1.112
```

```yaml
Starting Nmap 7.80 ( https://nmap.org ) at 2023-01-27 16:07 UTC
Nmap scan report for usama (192.168.1.112)
Host is up (0.00031s latency).
Not shown: 999 closed ports
PORT   STATE SERVICE
22/tcp open  ssh

Nmap done: 1 IP address (1 host up) scanned in 0.23 seconds
```

# Install Nodejs specifc version

```bash
#Add NodeSource PPA

# This command uses curl to download a script from the specified URL (https://deb.nodesource.com/setup_16.x). The -fsSL options passed to curl are used to make the command more secure by failing silently if there are any issues with the SSL certificate, and also by showing error message if the HTTP request fails. The script is then passed to sudo, which runs the command with superuser privileges. The -E option passed to sudo preserves the user's environment variables. The script that is downloaded and run sets up the NodeSource software repository for Node.js version 16 on the system. This will allow the user to install Node.js version 16 using the package manager.

curl -s https://deb.nodesource.com/setup_16.x | sudo bash
# When complete, you will see a confirmation that looks like this:
```

```bash
# Install NodeJS 16
sudo apt install nodejs -y
# confirm the installed version
node -v
```

# Make some Alias

alias df = df -h

---

You can use the reverse search feature by pressing CTRL + R in the terminal, which will let you search through your command history in reverse order. You can then type in a search term and press CTRL + R again to find the next match.

Use the ctrl + a and ctrl + e shortcuts: You can use the CTRL + A and CTRL + E shortcuts to move to the beginning and end of the current line

---
