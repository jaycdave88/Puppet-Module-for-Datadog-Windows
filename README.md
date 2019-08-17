# ddagentwindows - Puppet module for Datadog
================ 

## Description

This module serves the purpose to install/uninstall of the Datadog agent onto Windows enviorments.

Using this module will assist in deployment of the Datadog agent onto Windows specific enviorments. 


## Install 

Since this puppet module is not in the forge. To install, clone down and unzip this repo and place it into:  `C:\ProgramData\PuppetLabs\code\environments\production\modules`

## Run Command

Once the **ddagentwindows** module has beed added to the `C:\ProgramData\PuppetLabs\code\environments\production\modules` directory. Open the **ddagentwindows** and navigate to `/tests/manifests/site.pp`

use `puppet apply .\site.pp`

**_site.pp:_**

```
# Run the site.pp with the puppet apply command. 
# Please update the node paramater with the Windows machine name. 
# To find the Windows machine name, within PowerShell run 'whoami'.

node "win-80shlhj26ts.ec2.internal" {
    class { "ddagentwindows::install":
       api_key => "your_API_key",
       baseurl => "https://s3.amazonaws.com/ddagent-windows-stable/datadog-agent-6-latest.amd64.msi",
       hostname => "my_hostname",
       tags => "mytag1,mytag2"
    }
    # Uncomment the uninstall to remove the Datadog agent
    # class { "ddagentwindows::uninstall":
   	# }
}
```


