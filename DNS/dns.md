# DNS

Every computer on internet connected to a huge worldwide tree of DNS

Organization have more than one DNS

Modern Router has DNS

DNS has a system to resolve name to IP

## DNS is service on tcp/ip network that enable clinet to translate name in to ip addres

```bash
nslookup linkedin.in
```

DNS use port 53 , tcp for zone transfering and UDP for naming

Steps:

1. set static host name
1. update packages and install bind9 package

Edit these files
include "/etc/bind/named.conf.options";
include "/etc/bind/named.conf.local";
include "/etc/bind/named.conf.default-zones";

---

Domain Name System (DNS) is a decentralized system that allows users to access websites by typing in easy-to-remember domain names (e.g., example.com) rather than numerical IP addresses. When you type a domain name into your web browser, the browser sends a request to a DNS server to resolve the domain name to an IP address. The DNS server then responds with the IP address, which the browser uses to connect to the correct website.

A nameserver is a server that translates domain names into IP addresses. When you register a domain name, you will need to specify the nameservers that will be responsible for translating that domain name into an IP address. This is done using the Domain Name System (DNS).

cPanel is a web-based control panel that provides a graphical interface and automation tools designed to simplify the process of hosting a website. It is often used by web hosting companies to provide a simple way for their customers to manage their websites, email accounts, and other hosting-related tasks.

To configure DNS in AWS, you will need to do the following:

Create a hosted zone in Amazon Route 53. A hosted zone is a container for DNS records that enables Amazon Route 53 to route traffic for a domain to the correct resources.

Create DNS records for your domain. There are several types of DNS records that you can create, including A records, CNAME records, and MX records. A records map a domain name to an IP address, CNAME records map a domain name to another domain name, and MX records specify the mail servers responsible for handling email for a domain.

Set the nameservers for your domain to the nameservers provided by Amazon Route 53. This will allow your domain to use the DNS records you have created in the hosted zone.

Test your configuration by using tools such as nslookup or dig to verify that your DNS records are being resolved correctly.

Here are a few additional points that may help clarify some aspects of DNS and its configuration:

DNS is hierarchical, meaning that it is organized into a tree-like structure. At the top of the hierarchy are the root servers, which are responsible for delegating requests to the appropriate top-level domains (TLDs), such as .com, .net, and .org. TLD servers are then responsible for delegating requests to the appropriate second-level domains (e.g., example.com), and so on.

There are two types of DNS servers: authoritative and recursive. Authoritative servers contain the DNS records for specific domains and are responsible for answering queries for those domains. Recursive servers are responsible for finding the appropriate authoritative server for a given query and returning the answer to the client.

When you create a hosted zone in Amazon Route 53, you will need to specify the name of the domain (e.g., example.com) and select the type of record set you want to create (e.g., A, CNAME, MX). You will then be able to enter the specific details for that record set, such as the IP address for an A record or the target domain for a CNAME record.

In order to use Amazon Route 53 as your DNS provider, you will need to set the nameservers for your domain to the nameservers provided by Amazon Route 53. This can typically be done through your domain registrar's website or control panel.

It is important to test your DNS configuration to ensure that it is working correctly. Tools such as nslookup and dig allow you to query DNS servers and view the results, which can help you troubleshoot any issues that may arise.

# Cname vs NS

## nameserver when you point Domain to IP

## cname when you point domain to sub domain

---

# DEMO

hostnamectl set-hostname webmail.usama.local
install

yum install bind bind-utils

```txt
//forward zone


zone "usama.local" IN {
type master;
file "usama.local.db";
allow-update { none: };
allow-query { any; };
};

// Backwar zone

zone "0.0.10.in-addr.arpa" IN {
type master;
file "usama.local.rev";
allow-update { none: };
allow-query { any; };
};
```

check file of

cat /etc/named.conf

restart named service and see listen port and IP
edit ip too listen on network it own ip not in localhost

now restaart
and check

netstat -antp

change client dns ip
ping 8.8.8.8 and check internet
ping any-server will not work

allow-query to network

primary DNS mean it will have zone files
secondry is a copy

FQDN -- > hostname + domain name

ZONE -> it is a portion of DNS tree , that covers one domain name or child domain name
