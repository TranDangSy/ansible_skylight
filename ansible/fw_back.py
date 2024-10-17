from netmiko import ConnectHandler # type: ignore
from datetime import datetime
my_fw = {'host': 'Skylight_FW01_G',
         'device_type': 'fortinet',
         'ip': '10.1.1.1',
         'username': 'backup_user',
         'password': 'buncha11a@',
         'port': '2222'
}
now = datetime.now()

net_connect = ConnectHandler(**my_fw)
net_connect.enable()

output = net_connect.send_command_timing('show full-configuration', delay_factor=4)

current_time = now.strftime('%d_%m_%Y')

with open("fortigate_backups/" + my_fw['host'] + '_' + current_time + ".cfg", 'w+') as f:
    for line in output:
        f.write(line)
