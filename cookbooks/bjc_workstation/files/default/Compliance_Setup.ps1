Write-Host "Copying compliance OIDC_CLIENT_ID to chef CHEF_GATE_OIDC_CLIENT_ID"
scp ~/.ssh/id_rsa.pub compliance:/tmp/CHEF_GATE_COMPLIANCE_SECRET
ssh compliance 'sudo mv /tmp/CHEF_GATE_COMPLIANCE_SECRET /opt/chef-compliance/sv/core/env/CHEF_GATE_COMPLIANCE_SECRET && sudo chef-compliance-ctl restart core'
ssh compliance 'sudo cp /opt/chef-compliance/sv/core/env/OIDC_CLIENT_ID /tmp && sudo chmod +r /tmp/OIDC_CLIENT_ID'
scp -3 compliance:/tmp/OIDC_CLIENT_ID chef:/tmp/CHEF_GATE_OIDC_CLIENT_ID
ssh chef 'sudo mv /tmp/CHEF_GATE_OIDC_CLIENT_ID /opt/opscode/sv/chef_gate/env/CHEF_GATE_OIDC_CLIENT_ID && sudo /opt/opscode/embedded/bin/sv restart chef_gate'
