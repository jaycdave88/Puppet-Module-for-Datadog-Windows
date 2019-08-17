class ddagentwindows::uninstall(){

	file { 'c:\tmp':
    ensure        => absent,
    owner         => 'Administrator',
    group         => 'Administrators',
    notify        => Package['Datadog Agent']
  }

  package { 'Datadog Agent':
    ensure                 => absent,
    uninstall_options      => ['/quiet']
  }
}