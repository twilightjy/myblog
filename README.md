# myblog
基于VUE+SpringBoot的个人博客网站

## 技术介绍

**前端：** "vue" + "vuex" + "vue-router" + "axios" + "vuetify" + "element" + "echarts"

**后端：** "SpringBoot" + "nginx" + "docker" + "SpringSecurity" + "Swagger2" + "MyBatisPlus" + "Mysql" + "Redis" + "elasticsearch" + "rabbitMQ" + "MaxWell" + "websocket"

**其他：** 接入QQ，微博第三方登录，接入腾讯云人机验证、websocket

## 运行环境

**服务器：** 阿里云2核4G CentOS7.2

**CDN：** 阿里云全站加速

**对象存储：** 阿里云OSS

## 开发工具

| 开发工具                      | 说明              |
| ----------------------------- | ----------------- |
| IDEA                          | Java开发工具IDE   |
| VSCode                        | Vue开发工具IDE    |
| Navicat                       | MySQL远程连接工具 |
| Another Redis Desktop Manager | Redis远程连接工具 |
| X-shell                       | Linux远程连接工具 |
| filezilla                     | Linux文件上传工具 |

## 开发环境

| 工具          | 版本   |
| ------------- | ------ |
| JDK           | 1.8    |
| MySQL         | 8.0.20 |
| Redis         | 6.0.5  |
| Elasticsearch | 7.9.2  |
| RabbitMQ      | 3.8.5  |

## docker部署项目

docker+nginx部署整个项目。

docker提供所需的环境。nginx作为服务器，且使用了websocket进行转发