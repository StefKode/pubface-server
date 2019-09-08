#Stefan Koch, 2019

all:
	./create_inventory
	ansible-playbook --ask-pass -i hosts -s server-basic.yml
