class ddagentwindows::install(
  $api_key,
  $baseurl,
  $hostname,
  $tags) {

  file { 'c:\tmp':
    ensure        => directory,
    owner         => 'Administrator',
    group         => 'Administrators',
    notify        => Exec['getdatadogmsi']
  }

	exec { 'getdatadogmsi':
  	command              => "Invoke-WebRequest $baseurl -outfile c:/tmp/datadog-agent-6-latest.amd64.msi",
  	onlyif               => "if ((test-path c:/tmp/datadog-agent-6-latest.amd64.msi) -eq \$true) {exit 1}",
  	provider             => powershell,
  	notify               => Package['Datadog Agent'],
  }

  package { 'Datadog Agent':
    ensure                  => installed,
    provider                => 'windows',
    source                  => "c:/tmp/datadog-agent-6-latest.amd64.msi",
    install_options         => ['/quiet', {'APIKEY' => $api_key, 'HOSTNAME' => $hostname, 'TAGS' => $tags}]
  }

  exec { 'DatadogRestart':
    command               => "& 'C:\Program Files\Datadog\Datadog Agent\embedded\agent.exe' restart-service",
    provider              => powershell,
  }

  service { 'datadogagent':
    ensure                => true,
    enable                => true,
    require               => Package['Datadog Agent'],
  }
}