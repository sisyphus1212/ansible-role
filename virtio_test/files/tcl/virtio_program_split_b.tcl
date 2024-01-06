puts "start program device b"
open_hw_manager
# Connect to the hardware server, allowing for non-JTAG devices as well
connect_hw_server -allow_non_jtag

# 打开硬件目标
open_hw_target

# 选择硬件设备
set current_device [lindex [get_hw_devices xcvu13p_CIV_0] 0]
# Refresh the hardware device
refresh_hw_device -update_hw_probes false $current_device

# 设置探针文件和程序文件的路径
set_property PROBES.FILE "/home/np/kongqd/2100p_bit/b/1130/k_machine_2100p_b_rev0_231130_196M.ltx" $current_device
set_property FULL_PROBES.FILE "/home/np/kongqd/2100p_bit/b/1130/k_machine_2100p_b_rev0_231130_196M.ltx" $current_device
set_property PROGRAM.FILE "/home/np/kongqd/2100p_bit/b/1130/k_machine_2100p_b_rev0_231130_196M_civ.bit" $current_device

# Program the hardware device
program_hw_devices $current_device
refresh_hw_device $current_device

#关闭硬件目标
close_hw_target
disconnect_hw_server
close_hw_manager
puts "program device successful"
exit
