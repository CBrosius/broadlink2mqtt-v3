This is a custom built of [Fredrick Bäcker´s Work](https://github.com/fbacker/broadlink-mqtt-bridge/)

## More information

Read the wiki https://github.com/fbacker/broadlink-mqtt-bridge/wiki

It has a Admin GUI for helping record IR / RF signals. You will be able with the filetree see all recorded actions, delete actions and if a disclamation mark occures, this means that the action is a duplicate of another (has same binary content).

![admin gui](https://raw.githubusercontent.com/fbacker/broadlink-mqtt-bridge/master/github/gui.png)

## Requirements

- MQTT-Broker
- Broadlink device e.g. RM 3 PRO


## Docker Notes

You are able to set the MQTT_Host and MQTT_Port via Environment-Variables (Default is 127.0.0.1:1833)
Autodiscovery is only working when Container is running via macvlan 

