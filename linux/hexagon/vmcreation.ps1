$cred = get-credential

$vm1 = @{

   resourceGroupName = 'hexa21'
   Name = 'vm2-hexa'
   location = 'eastus'
   ImageName = 'win2016Datacenter'
   PublicIpAddressName = 'vm2-public-Ip'
   openports = 3389,22,80,443
   size ='standard_B2s'
   credential= $cred
}

new-azvm @vm1
