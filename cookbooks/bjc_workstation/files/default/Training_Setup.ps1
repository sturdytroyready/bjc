# Here we are simply importing SSL certs from our AURD nodes
# This is so the browser won't throw errors when we access our site

function Import-RemoteCertificate {
    $name = $args[0]
    Write-Host ${Unix-Path $env:userprofile}/Downloads
    scp ${name}:/home/ubuntu/${name}.automate-demo.com.crt /c/Users/${env:USERNAME}/Downloads 
    Import-Certificate -FilePath  ${env:userprofile}\Downloads\${name}.automate-demo.com.crt -CertStoreLocation Cert:/LocalMachine/Root
}

set-executionpolicy -executionpolicy unrestricted -force -scope CurrentUser
Import-RemoteCertificate "ecomacceptance"
Import-RemoteCertificate "union"
Import-RemoteCertificate "rehearsal"
Import-RemoteCertificate "delivered"
