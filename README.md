# Aria2

本项目是 [aria2-with-webui](https://github.com/XUJINKAI/aria2-with-webui) 的分支，感谢作者 [XUJINKAI](https://github.com/XUJINKAI) 。

Only 29Mb.
Edit config file out of the image.
Move file completed to another folder.
(Tasks that contains more than one files will not be moved.)

### 创建容器

请使用实际的路径替换以下命令中的 `/DOWNLOAD_DIR` 和 `CONFIG_DIR`，他们将容器中的下载目录和配置文件目录映射到你指定的主机路径上，以便于管理下载的文件和 Aria2 的配置。

```
sudo docker run -d \
--name aria2 \
-p 6800:6800 \
-p 6880:80 \
-p 6888:8080 \
-v /DOWNLOAD_DIR:/data \
-v /CONFIG_DIR:/config \
-e SECRET=YOUR_SECRET_CODE \
getnas/aria2
```

> 注意：如果不需要浏览下载目录，则去掉 `-p 6888:8080` 参数。
> 提示：如果希望 aria2 容器随 docker 自动运行，则添加 `--restart=always` 参数。
> 提示：请用随意的一组字符串替换 `YOUR_SECRET_CODE`，在浏览器中管理 aria2 时需要用这个安全代码认证身份，以防他人恶意使用。

### 使用方法

* `http://serverip:6880` 打开 web 管理界面
* `http://serverip:6888` 浏览下载目录

### 涉及的项目

[Aria2](https://github.com/aria2/aria2)
[WebUI-Aria2](https://github.com/ziahamza/webui-aria2)
[aria2-with-webui](https://github.com/XUJINKAI/aria2-with-webui)




请修复docker上内存占用过高的问题，我以高权限不限制内存进行运行，竟然高达1.22G的RAM占用。望修复
