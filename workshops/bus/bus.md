Application Bus
---

1. Some theory:
   # https://en.wikipedia.org/wiki/D-Bus
   # https://www.freedesktop.org/wiki/Software/dbus/
   
2. Install the 'd-feet' package (D-Bus debugger).

       comp-core-i7-3615qm-0dbf32 ~ # apt-get install d-feet
 
3. Run 'd-feet' to see the installed services:
 
       andrewt@comp-core-i7-3615qm-0dbf32 ~ $ d-fee
 
    ![1](Pic01.png)

4. See list of dbus command-line tools:

       andrewt@comp-core-i7-3615qm-0dbf32 ~ $ dbus-
       dbus-cleanup-sockets   dbus-launch    dbus-run-session   dbus-update-activation-environment  
       dbus-daemon            dbus-monitor   dbus-send          dbus-uuidgen   

5. Use the 'dbus-send' tool to introspect the properties of NetworkManager:

       andrewt@comp-core-i7-3615qm-0dbf32 ~ $ dbus-send --system --print-reply --dest=org.freedesktop.NetworkManager /org/freedesktop/NetworkManager/Devices/1 org.freedesktop.DBus.Introspectable.Introspect
       method return time=1590384778.681292 sender=:1.6 -> destination=:1.141 serial=3362 reply_serial=2
          string "<!DOCTYPE node PUBLIC "-//freedesktop//DTD D-BUS Object Introspection 1.0//EN"
                             "http://www.freedesktop.org/standards/dbus/1.0/introspect.dtd">
       <!-- GDBus 2.60.7 -->
       <node>
         <interface name="org.freedesktop.DBus.Properties">
           <method name="Get">
             <arg type="s" name="interface_name" direction="in"/>
             <arg type="s" name="property_name" direction="in"/>
             <arg type="v" name="value" direction="out"/>
           </method>
           <method name="GetAll">
             <arg type="s" name="interface_name" direction="in"/>
             <arg type="a{sv}" name="properties" direction="out"/>
           </method>
           <method name="Set">
             <arg type="s" name="interface_name" direction="in"/>
             <arg type="s" name="property_name" direction="in"/>
             <arg type="v" name="value" direction="in"/>
           </method>
           <signal name="PropertiesChanged">
             <arg type="s" name="interface_name"/>
             <arg type="a{sv}" name="changed_properties"/>
             <arg type="as" name="invalidated_properties"/>
           </signal>
         </interface>
         <interface name="org.freedesktop.DBus.Introspectable">
           <method name="Introspect">
             <arg type="s" name="xml_data" direction="out"/>
           </method>
         </interface>
         <interface name="org.freedesktop.DBus.Peer">
           <method name="Ping"/>
           <method name="GetMachineId">
             <arg type="s" name="machine_uuid" direction="out"/>
           </method>
         </interface>
         <interface name="org.freedesktop.NetworkManager.Device.Statistics">
           <signal name="PropertiesChanged">
             <arg type="a{sv}" name="properties"/>
           </signal>
           <property type="u" name="RefreshRateMs" access="readwrite"/>
           <property type="t" name="TxBytes" access="read"/>
           <property type="t" name="RxBytes" access="read"/>
         </interface>
         <interface name="org.freedesktop.NetworkManager.Device.Generic">
           <signal name="PropertiesChanged">
             <arg type="a{sv}" name="properties"/>
           </signal>
           <property type="s" name="HwAddress" access="read"/>
           <property type="s" name="TypeDescription" access="read"/>
         </interface>
         <interface name="org.freedesktop.NetworkManager.Device">
           <method name="Reapply">
             <arg type="a{sa{sv}}" name="connection" direction="in"/>
             <arg type="t" name="version_id" direction="in"/>
             <arg type="u" name="flags" direction="in"/>
           </method>
           <method name="GetAppliedConnection">
             <arg type="u" name="flags" direction="in"/>
             <arg type="a{sa{sv}}" name="connection" direction="out"/>
             <arg type="t" name="version_id" direction="out"/>
           </method>
           <method name="Disconnect"/>
           <method name="Delete"/>
           <signal name="StateChanged">
             <arg type="u" name="new_state"/>
             <arg type="u" name="old_state"/>
             <arg type="u" name="reason"/>
           </signal>
           <property type="s" name="Udi" access="read"/>
           <property type="s" name="Interface" access="read"/>
           <property type="s" name="IpInterface" access="read"/>
           <property type="s" name="Driver" access="read"/>
           <property type="s" name="DriverVersion" access="read"/>
           <property type="s" name="FirmwareVersion" access="read"/>
           <property type="u" name="Capabilities" access="read"/>
           <property type="u" name="Ip4Address" access="read"/>
           <property type="u" name="State" access="read"/>
           <property type="(uu)" name="StateReason" access="read"/>
           <property type="o" name="ActiveConnection" access="read"/>
           <property type="o" name="Ip4Config" access="read"/>
           <property type="o" name="Dhcp4Config" access="read"/>
           <property type="o" name="Ip6Config" access="read"/>
           <property type="o" name="Dhcp6Config" access="read"/>
           <property type="b" name="Managed" access="readwrite"/>
           <property type="b" name="Autoconnect" access="readwrite"/>
           <property type="b" name="FirmwareMissing" access="read"/>
           <property type="b" name="NmPluginMissing" access="read"/>
           <property type="u" name="DeviceType" access="read"/>
           <property type="ao" name="AvailableConnections" access="read"/>
           <property type="s" name="PhysicalPortId" access="read"/>
           <property type="u" name="Mtu" access="read"/>
           <property type="u" name="Metered" access="read"/>
           <property type="aa{sv}" name="LldpNeighbors" access="read"/>
           <property type="b" name="Real" access="read"/>
           <property type="u" name="Ip4Connectivity" access="read"/>
           <property type="u" name="Ip6Connectivity" access="read"/>
         </interface>
       </node>
       "

6. More convenient facilities to manage D-Bus are provided by
   the ['qdbus'](https://packages.debian.org/ru/sid/qdbus) tool. Please install it:
   
       comp-core-i7-3615qm-0dbf32 ~ # sudo apt-get install qt5-dbus
       
   Run 
   
       andrewt@comp-core-i7-3615qm-0dbf32 ~ $ qdbusviewer
 
   ![2](Pic02.png)

7.  See how to use command-line tool 'qdbus':

        andrewt@comp-core-i7-3615qm-0dbf32 ~ $ qdbus --help
        Usage: qdbus [--system] [--bus busaddress] [--literal] [servicename] [path] [method] [args]
  
         servicename       the service to connect to (e.g., org.freedesktop.DBus)
         path              the path to the object (e.g., /)
         method            the method to call, with or without the interface
         args              arguments to pass to the call
        With 0 arguments, qdbus will list the services available on the bus
        With just the servicename, qdbus will list the object paths available on the service
        With service name and object path, qdbus will list the methods, signals and properties available on the object
 
        Options:
         --system          connect to the system bus
         --bus busaddress  connect to a custom bus
         --literal         print replies literally
  