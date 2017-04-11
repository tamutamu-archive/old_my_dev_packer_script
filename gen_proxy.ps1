$PROXY_HOST=""
$PROXY_PORT=""

$code = @"
export http_proxy=http://${PROXY_HOST}:${PROXY_PORT}

"@

$code = $code + @'
cat << EOT > /etc/profile.d/proxy.sh
export http_proxy=${http_proxy}
export https_proxy=${http_proxy}
export HTTP_PROXY=${http_proxy}
export HTTPS_PROXY=${http_proxy}
EOT
'@

[IO.File]::WriteAllText('scripts/proxy.sh',${code});