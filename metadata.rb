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
recipe "chef-jenkins::default", ""
recipe "chef-jenkins::iptables", ""
recipe "chef-jenkins::node_jnlp", ""
recipe "chef-jenkins::node_ssh", ""
recipe "chef-jenkins::node_windows", ""
recipe "chef-jenkins::proxy_apache2", ""
recipe "chef-jenkins::proxy_nginx", ""

all_recipes = [
 "chef-jenkins::default",
 "chef-jenkins::iptables",
 "chef-jenkins::node_jnlp",
 "chef-jenkins::node_ssh",
 "chef-jenkins::node_windows",
 "chef-jenkins::proxy_apache2",
 "chef-jenkins::proxy_nginx"
]

attribute "jenkins/server/home", :recipes => all_recipes
attribute "jenkins/server/port", :recipes => all_recipes
attribute "jenkins/server/url", :recipes => all_recipes
attribute "jenkins/server/plugins", :recipes => all_recipes
