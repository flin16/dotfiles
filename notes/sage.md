Conda + Sage + JupyterHub 配置指南
1. 环境初始化

• 安装 Miniforge/Mamba: 下载并运行安装脚本。

• 创建 Sage 专用环境: `sudo /opt/miniforge/bin/mamba create -p /opt/conda/envs/sage_env sage python=3.11`

2. 权限管理 (关键)

• 接管环境所有权: `sudo chown -R $(whoami):$(whoami) /opt/conda/envs/sage_env`

• 接管包缓存权限: `sudo chown -R $(whoami):$(whoami) /opt/miniforge/pkgs`

3. 环境激活与包管理

• 激活环境: `mamba activate /opt/conda/envs/sage_env`

• 安装扩展包: `mamba install <package_name>`

• 使用 Pip 安装: `pip install <package_name>`

4. JupyterHub 集成

• 安装 JupyterHub 环境: `mamba create -n jupyterhub jupyterhub`
• 复制一份配置文件到/etc/jupyterhub/jupyterhub_conf.py
• 注册 Sage 内核到 Jupyter: 在 `sage_env` 激活状态下运行： `python -m ipykernel install --name 'sage_env' --display-name 'SageMath (conda)' --user`
• 复制一份systemd jupyterhub.service
5. 常用维护命令

• 查看环境列表: `mamba env list`

• 清理缓存: `mamba clean --all`

查看 service文件你就知道环境在哪里了
