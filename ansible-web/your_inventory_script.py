#!/usr/bin/env python3
import json

# Define your dynamic inventory logic here
# For simplicity, a static inventory is returned

inventory_data = {
            "_meta": {
                        "hostvars": {
                                        "server1": {
                                                            "ansible_host": "3.82.130.61",
                                                                            "ansible_user": "ec2-user",
                                                                                            "ansible_private_key_file": "/root/devops2023/ansible-web/jenkins1.pem"
                                                                                                        },
                                                    "server2": {
                                                                        "ansible_host": "52.207.243.106",
                                                                                        "ansible_user": "ec2-user",
                                                                                                        "ansible_private_key_file": "/root/devops2023/ansible-web/jenkins1.pem"
                                                                                                                    },
                                                                "server2": {
                                                                                    "ansible_host": "44.201.103.245",
                                                                                                    "ansible_user": "ec2-user",
                                                                                                                    "ansible_private_key_file": "/root/devops2023/ansible-web/jenkins1.pem"
                                                                                                                                },

                                                                            # Add more hosts as needed
                                                                                    }
                            },
                "all": {
                            "children": ["web", "app", "db"]
                                },
                    "web": {
                                "hosts": ["3.82.130.61"]
                                    },
                        "app": {
                                    "hosts": ["52.207.243.106"]
                                        },
                            "db": {
                                        "hosts": ["44.201.103.245"]  
                                            }
                            }

# Output the inventory in JSON format
print(json.dumps(inventory_data))
