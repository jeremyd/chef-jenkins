maintainer       "Fletcher Nichol"
maintainer_email "fnichol@nichol.ca"
license          "Apache 2.0"
description      "Installs and configures Jenkins CI server & slaves"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.5"

%w{ debian ubuntu centos redhat }.each do |os|
  supports os
end

%w{ runit java }.each do |cb|
  depends cb
end

recipe "jenkins",                 "Installs a Jenkins CI server"
recipe "jenkins::default", ""
recipe "jenkins::iptables", ""
recipe "jenkins::node_jnlp", ""
recipe "jenkins::node_ssh", ""
recipe "jenkins::node_windows", ""
recipe "jenkins::proxy_apache2", ""
recipe "jenkins::proxy_nginx", ""

all_recipes = [
 "jenkins::default",
 "jenkins::iptables",
 "jenkins::node_jnlp",
 "jenkins::node_ssh",
 "jenkins::node_windows",
 "jenkins::proxy_apache2",
 "jenkins::proxy_nginx"
]

attribute "jenkins/server/home", :recipes => all_recipes
attribute "jenkins/server/url", :recipes => all_recipes
attribute "jenkins/server/plugins", :recipes => all_recipes
attribute "jenkins/node/variant", :default => "nginx", :recipes => all_recipes
attribute "jenkins/node/listen_ports", :type => "array", :recipes => all_recipes
attribute "jenkins/node/host_name", :recipes => all_recipes
attribute "jenkins/node/host_aliases", :type => "array", :recipes => all_recipes
