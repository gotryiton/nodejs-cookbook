actions :install, :uninstall

# Name of the nrpe check, used for the filename and the command name
attribute :package_name, :kind_of => String, :name_attribute => true
# Version number, semantic versioning e.g. "1.2.3" or a range ">=0.5.0 <0.6.0"
attribute :version, :kind_of => String, :required => true
attribute :url, :kind_of => String, :required => false


def initialize(*args)
  super
  @action = :install
end
