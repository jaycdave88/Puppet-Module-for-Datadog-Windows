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
