# Nexus3

- nexus-data：需要赋予200权限，否则docker中会出现permission denied
- Default credentials are: admin / admin123
- test url: http://localhost:8071

## pipy

- 临时访问：`pip install -i http://localhost:8081/repository/pypi/simple some-package --trusted-host localhost` 

- 设置默认pip请求：`pip config set global.index-url http://localhost:8071/repository/pypi/simple`

- 设置默认服务器验证：`pip config set install.trusted-host localhost`


