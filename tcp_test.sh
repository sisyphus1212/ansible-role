sudo su
case_name=virtio_test
ansible-playbook ./inventory/init.yml --extra-vars "case_name=${case_name}"
ansible-playbook ./${case_name}.yml