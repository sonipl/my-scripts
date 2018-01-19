##Input VALUE###
echo "Enter Primary Interface: " ;read INTF1
echo "Enter Secondory Interface:";read INTF2
echo "Enter VLAN ID:";read VLANID
echo "Enter IP Address :";read IPADR
echo "Enter PREFIX example 23, 24 :"; read PREFX
echo "Enter Gateway  :"; read GWY
echo "INTERFACES $INTF1 and $INTF2 , VLAN = $VLANID IP = $IPADR Mask=$PREFX GW=$GWY"
echo "Creating bond with above values, Press enter if values are correct or CTRL+C for exit";read ans
##########
WKDIR="/home/psoni/etc/sysconfig/network-scripts"
#WKDIR="/etc/sysconfig/network-scripts"
WKFILE1="$WKDIR/ifcfg-$INTF1"
WKFILE2="$WKDIR/ifcfg-$INTF2"
WKFILE3="$WKDIR/ifcfg-bond0"
WKFILE4="$WKDIR/ifcfg-bond0.$VLANID"
##########
echo "Creating interface ifcfg-$INTF1......"; sleep 5
echo "TYPE=Ethernet" >$WKFILE1
echo "NAME=$INTF1" >>$WKFILE1
echo "DEVICE=$INTF1" >>$WKFILE1
echo "ONBOOT=yes" >>$WKFILE1
echo "MASTER=bond0" >>$WKFILE1
echo "SLAVE=yes" >>$WKFILE1
#echo "UUID=f1ed0a1d-f11d-40f2-acd9-1c7f338fe705" >>ifcfg-$INTF1
##########
echo "Creating interface ifcfg-$INTF2......"; sleep 5
echo "TYPE=Ethernet" >$WKFILE2
echo "NAME=$INTF2" >>$WKFILE2
echo "DEVICE=$INTF2" >>$WKFILE2
echo "ONBOOT=yes" >>$WKFILE2
echo "MASTER=bond0" >>$WKFILE2
echo "SLAVE=yes" >>$WKFILE2
#echo "UUID=f1ed0a1d-f11d-40f2-acd9-1c7f338fe705" >>ifcfg-$INTF2
##########
echo "Creating Bond0  interface......"; sleep 5
echo "DEVICE=bond0" >$WKFILE3
echo "NAME=bond0" >>$WKFILE3
echo "TYPE=bond" >>$WKFILE3
echo "BONDING_MASTER=yes" >>$WKFILE3
echo "ONBOOT=yes" >>$WKFILE3
echo 'BONDING_OPS="mode=1 miimon=100"'  >>$WKFILE3
##########
echo "Creating Bond interface for VLAN $VLANID......"; sleep 5
echo "TYPE=vlan" >$WKFILE4
echo "DEVICE=bond0.$VLANID" >>$WKFILE4
echo "PHYSDEV=bond0" >>$WKFILE4
echo "ONBOOT=yes" >>$WKFILE4
echo "VLAN=yes" >>$WKFILE4
echo "VLAN_ID=$VLANID" >>$WKFILE4
echo "IPADDR=$IPADR" >>$WKFILE4
echo "PREFIX=$PREFX" >>$WKFILE4
echo "GATEWAY=$GWY" >>$WKFILE4
##########
