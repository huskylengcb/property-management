#服务器地址,是使用ssh的方式登录服务器
set :domain, 'app@139.129.21.65'
#服务器中项目部署位置
set :deploy_to, '/apps/www/property-management'
#git代码仓库
set :repository, 'https://github.com/huskylengcb/property-management.git'
#git分支
set :branch, 'main'