case_name=virtio_test
sudo ansible-playbook ./generate_inventory_vars.yml --extra-vars "case_name=${case_name}"
sudo ansible-playbook ./${case_name}.yml