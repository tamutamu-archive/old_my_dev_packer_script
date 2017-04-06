packer build -var-file=common_var.conf template.json > build.log 2>&1

@if not "%ERRORLEVEL%"  == "0" (
  echo "ÉGÉâÅ[ÅI"
) else (
  vagrant box add --force my_dev my_dev.box
  del my_dev.box
)
