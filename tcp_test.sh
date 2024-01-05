case_name=virtio_test
ansible-playbook ./generate_inventory_vars.yml --extra-vars "case_name=${case_name}"
ansible-playbook ./${case_name}.yml