
Online use:
```bash
curl -s https://raw.githubusercontent.com/dingyiran/nv/main/gpu.sh | bash
```

Or 
-  install to ~/
```bash
curl -s https://raw.githubusercontent.com/dingyiran/nv/main/gpu.sh -o ~/gpu.sh
```

- add function to ~/.bashrc
```bash
echo "alias nv='~/gpu.sh'" >> ~/.bashrc
source ~/.bashrc
```

- use `nv` to monitor gpu