{
  boot.kernel.sysctl = {
    "vm.swappiness" = "10";
    "vm.vfs_cache_pressure" = "1000";
    "vm.dirty_ratio" = "30";
    "vm.dirty_background_ratio" = "5";
    "vm.max_map_count" = "262144";
    "net.core.rmem_default" = "1048576";
    "net.core.rmem_max" = "16777216";
    "net.core.wmem_default" = "1048576";
    "net.core.wmem_max" = "16777216";
    "net.core.somaxconn" = "16384";
    "net.core.netdev_max_backlog" = "65536";
    "net.core.optmem_max" = "65536";
    "net.ipv4.tcp_synack_retries" = "2";
    "net.ipv4.ip_local_port_range" = "1024 65535";
    "net.ipv4.tcp_rfc1337" = "1";
    "net.ipv4.tcp_fin_timeout" = "15";
    "net.ipv4.tcp_keepalive_time" = "60";
    "net.ipv4.tcp_keepalive_probes" = "6";
    "net.ipv4.tcp_keepalive_intvl" = "10";
    "net.ipv4.tcp_mtu_probing" = "1";
    "net.ipv4.tcp_mem" = "65536 131072 262144";
    "net.ipv4.udp_mem" = "65536 131072 262144";
    "net.ipv4.tcp_rmem" = "4096 87380 16777216";
    "net.ipv4.udp_rmem_min" = "16384";
    "net.ipv4.tcp_wmem" = "4096 65536 16777216";
    "net.ipv4.udp_wmem_min" = "16384";
    "net.ipv4.tcp_max_tw_buckets" = "65536";
    "net.ipv4.tcp_tw_reuse" = "1";
    "net.ipv4.tcp_syncookies"="1";
    "net.ipv4.tcp_max_syn_backlog"="65536";
    "net.ipv4.tcp_window_scaling"="1";
    "net.ipv4.neigh.default.unres_qlen"="100";
    "net.ipv4.icmp_echo_ignore_broadcasts" = "1";
    "net.ipv4.icmp_ignore_bogus_error_responses" = "1";
    "net.ipv4.conf.all.accept_source_route" = "0";
    "net.ipv4.conf.default.accept_source_route" = "0";
    "net.ipv4.conf.all.rp_filter" = "1";
    "net.ipv4.conf.default.rp_filter" = "1";
    "net.ipv4.tcp_timestamps" = "0";
    "net.ipv4.tcp_congestion_control" = "htcp";
    "net.ipv4.tcp_no_metrics_save" = "1";
    "net.ipv4.tcp_fastopen" = "3";
    "net.ipv4.tcp_slow_start_after_idle" = "0";
    "net.ipv4.tcp_sack" = "1";
    "net.ipv4.tcp_fack" = "1";
    "net.ipv4.tcp_low_latency" = "1";
    "net.ipv4.tcp_adv_win_scale" = "1";
    "net.ipv4.conf.all.log_martians" = "0";
    "net.ipv4.conf.default.log_martians" = "0";
    "net.ipv4.conf.all.send_redirects" = "0";
    "net.ipv4.conf.default.send_redirects" = "0";
    "net.ipv4.conf.all.accept_redirects" = "0";
    "net.ipv4.conf.default.accept_redirects" = "0";
    "net.ipv4.conf.all.secure_redirects" = "0";
    "net.ipv4.conf.default.secure_redirects" = "0";
    "net.ipv6.conf.all.accept_redirects" = "0";
    "net.ipv6.conf.default.accept_redirects" = "0";
    "net.ipv6.conf.all.accept_source_route" = "0";
    "net.ipv6.conf.default.accept_source_route" = "0";
    "kernel.core_uses_pid" = "1";
    "kernel.dmesg_restrict" = "1";
    "kernel.randomize_va_space" = "2";
    "kernel.sysrq" = "0";
    "kernel.yama.ptrace_scope" = "1";
    "kernel.pid_max" = "131072";
    "fs.file-max" = "3254375";
    "fs.inotify.max_user_watches" = "16777216";
    "fs.inotify.max_user_instances" = "1048576";
    "fs.inotify.max_queued_events" = "65536";
    "fs.mqueue.msg_max" = "16384";
    "fs.mqueue.queues_max" = "4096";
  };

  security.pam.loginLimits = [
    { domain = "*"; type = "soft"; item = "nofile"; value = "1048576"; }
    { domain = "*"; type = "hard"; item = "nofile"; value = "1048576"; }
    { domain = "*"; type = "soft"; item = "stack"; value = "65536"; }
    { domain = "*"; type = "hard"; item = "stack"; value = "unlimited"; }
    { domain = "*"; type = "soft"; item = "memlock"; value = "8192"; }
    { domain = "*"; type = "hard"; item = "memlock"; value = "8192"; }
  ];
}
