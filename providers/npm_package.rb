require 'chef/mixin/shell_out'
require 'chef/mixin/language'
include Chef::Mixin::ShellOut

action :install do
  package_list_command = "npm -g list --parseable --long"
  p = shell_out!(package_list_command)
  installed_version = grep_for_version(p.stdout, new_resource.package_name)

  if installed_version.nil? || installed_version != new_resource.version
    Chef::Log.info "Installing #{new_resource.package_name}@#{new_resource.version}"
    url = new_resource.url || "#{new_resource.package_name}@\"#{new_resource.version}\""
    execute "npm-install-global" do
      user "root"
      command "npm -g --unsafe-perm install #{url}"
    end
  else
    Chef::Log.info "Not installing #{new_resource.package_name}@#{new_resource.version} already up to date"
  end
end

action :uninstall do
  execute "npm-install-global" do
    command "npm uninstall -g #{new_resource.package_name}"
  end
end

# from pear provider
def grep_for_version(stdout, package)
  v = nil
  stdout.split(/\n/).grep(/#{package}\@/i).each do |m|
    v = m.split(/\@/)[1].sub(/\:/,"").strip
  end
  v
end
