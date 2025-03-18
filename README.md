
Online use:
```bash
curl -s https://raw.githubusercontent.com/Yiyi-philosophy/nv/main/gpu.sh | bash
```

Or 
-  install to ~/
```bash
curl -s https://raw.githubusercontent.com/Yiyi-philosophy/nv/main/gpu.sh > ~/gpu.sh && chmod +x ~/gpu.sh
```

- add function to ~/.bashrc
```bash
echo "alias nv='~/gpu.sh'" >> ~/.bashrc
source ~/.bashrc
```

- use `nv` to monitor gpu
```bash
$nv
Host: <7ghca2j9s51nf-0> - 2025-03-18 18:55:40 (Press Ctrl+C to exit)
+---------------+-------------+---------------------------+
| GPU Name      | Utilization |        Memory Usage       |
+---------------+-------------+---------------------------+
| A800-80GB     |          0% |    0.0/80.0   GiB ( 0.0%) |
+---------------+-------------+---------------------------+
$nv
Host: <6nvc03oe9i35j-0> - 2025-03-18 18:56:04 (Press Ctrl+C to exit)
+---------------+-------------+---------------------------+
| GPU Name      | Utilization |        Memory Usage       |
+---------------+-------------+---------------------------+
| V100-32GB     |          0% |    0.0/32.0   GiB ( 0.0%) |
| V100-32GB     |          0% |    0.0/32.0   GiB ( 0.0%) |
| V100-32GB     |          0% |    0.0/32.0   GiB ( 0.0%) |
+---------------+-------------+---------------------------+
```
