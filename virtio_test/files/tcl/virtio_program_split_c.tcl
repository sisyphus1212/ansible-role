puts "start program device c"
open_hw_manager
connect_hw_server -allow_non_jtag
# 打开硬件目标
open_hw_target localhost:3121/xilinx_tcf/Xilinx/87092A

# 选择硬件设备
set current_hw_device [get_hw_devices xcvu13p_CIV_0]
refresh_hw_device -update_hw_probes false $current_hw_device

# 设置探针文件和程序文件的路径
set probes_file "/home/clover/2100p_bit/240105/buf_opt_1/k_machine_2100p_virt_c_buf_opt20240105b.ltx"
set full_probes_file "/home/clover/2100p_bit/240105/buf_opt_1/k_machine_2100p_virt_c_buf_opt20240105b.ltx"
set program_file "/home/clover/2100p_bit/240105/buf_opt_1/k_machine_2100p_virt_c_buf_opt20240105b_civ.bit"

# 应用文件路径设置
set_property PROBES.FILE $probes_file $current_hw_device
set_property FULL_PROBES.FILE $full_probes_file $current_hw_device
set_property PROGRAM.FILE $program_file $current_hw_device

# 对硬件设备进行编程
program_hw_devices $current_hw_device
refresh_hw_device $current_hw_device

#关闭硬件目标
close_hw_target
disconnect_hw_server
close_hw_manager
puts "program device successful"
exit