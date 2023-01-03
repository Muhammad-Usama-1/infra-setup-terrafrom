# Network Management in Linux

IPv4 and IPv6 are different versions of the Internet Protocol (IP), the protocol that is used to route traffic on the internet.

IPv4 is the fourth version of the IP protocol and is the most widely used version today. It uses 32-bit addresses and can support up to 4.3 billion unique addresses. IPv4 addresses are typically written in dotted decimal notation, such as 192.168.0.1.

IPv6 is the sixth version of the IP protocol and was designed to address the shortage of IPv4 addresses. It uses 128-bit addresses and can support up to 3.4 x 10^38 unique addresses. IPv6 addresses are typically written in hexadecimal notation, such as 2001:0db8:85a3:0000:0000:8a2e:0370:7334.

One of the main differences between IPv4 and IPv6 is the size of the address space. IPv6 has a much larger address space than IPv4, which means that it can support a much larger number of devices on the internet. IPv6 also has several other improvements over IPv4, including support for enhanced security, better support for mobile devices, and improved support for multicast traffic.

In summary, IPv4 and IPv6 are different versions of the IP protocol that are used to route traffic on the internet. IPv4 is the most widely used version today, but IPv6 is increasingly being adopted as the shortage of IPv4 addresses becomes more acute.

To assign a static IP address to a network interface in Ubuntu using the nmtui command-line tool, you can follow these steps:

Open the nmtui tool by typing the following command into a terminal window:

```bash
sudo nmtui
```

From the main menu, select the Edit a connection option and press Enter.

In the list of connections, select the interface that you want to configure and press Enter.

In the Edit Connection screen, select the IPv4 tab.

From the Method drop-down menu, select the Manual option.

In the Addresses field, enter the static IP address that you want to assign to the interface. For example: 192.168.0.100/24.

In the Gateway field, enter the IP address of the default gateway for the network.

Press OK to save the changes.

Select the Activate a connection option from the main menu and press Enter.

In the list of connections, select the interface that you just configured and press Enter to activate it.

Close the nmtui tool by pressing Esc or q.

To make the changes persistent across reboots, you will need to edit the network configuration file for the interface. The file is usually located at /etc/netplan/XX-YY-interface.yaml, where XX-YY is the name of the interface.

For example, if you are configuring the ens3 interface, the configuration file would be /etc/netplan/50-cloud-init.yaml. Open the file in a text editor and add the following lines:

```bash
network:
  version: 2
  ethernets:
    ens3:
      addresses: [192.168.0.100/24]
      gateway4: 192.168.0.1
```

Save the file and apply the changes by running the following command:

```bash
sudo netplan apply
```

I hope this helps! Let me know if you have any questions.
