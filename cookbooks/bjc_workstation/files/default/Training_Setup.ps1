function Import-RemoteCertificate {
    $name = $args[0]
    Write-Host ${Unix-Path $env:userprofile}/Downloads
    scp ${name}:/home/ubuntu/${name}.automate-demo.com.crt /c/Users/${env:USERNAME}/Downloads 
    Import-Certificate -FilePath  ${env:userprofile}\Downloads\${name}.automate-demo.com.crt -CertStoreLocation Cert:/LocalMachine/Root
}

set-executionpolicy -executionpolicy unrestricted -force -scope CurrentUser

"Reticulating Splines..."

Import-RemoteCertificate "ecomacceptance"
Import-RemoteCertificate "union"
Import-RemoteCertificate "rehearsal"
Import-RemoteCertificate "delivered"

Write-Host "Atomic Batteries to Power..."

$host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")

Write-Host "Starting cmder..."
& "C:\tools\cmder\Cmder.exe"
