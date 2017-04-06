set PROXY_HOST=
set PROXY_PORT=


@set code="export http_proxy=http://%PROXY_HOST%:%PROXY_PORT%"
@echo %code:"=% > scripts\proxy.sh

@echo. >> scripts\proxy.sh

@set code="cat ^<^< EOT ^> /etc/profile.d/proxy.sh"
@echo %code:"=% >> scripts\proxy.sh

@set code="export http_proxy=$http_proxy"
@echo %code:"=% >> scripts\proxy.sh

@set code="export https_proxy=$http_proxy"
@echo %code:"=% >> scripts\proxy.sh

@set code="export HTTP_PROXY=$http_proxy"
@echo %code:"=% >> scripts\proxy.sh

@set code="export HTTPS_PROXY=$http_proxy"
@echo %code:"=% >> scripts\proxy.sh

@set code="EOT"
@echo %code:"=% >> scripts\proxy.sh

