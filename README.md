#NLPCN网站部署流程

1. 获得代码
2. 利用maven编译

    > 在源码根目录下运行 clean assembly:assembly compile

3. 编译后进入 ${源码目录}/target/nlpcn-distribution 
    
    > 打开conf/config.properties 修改web_dir=webapp,当然你也可以修改一些其他配置

4. 运行run.sh 启动项目 goodluck
