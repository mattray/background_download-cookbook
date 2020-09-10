resource_name :background_download
provides :background_download

property :path, String, name_property: true
property :source, String, required: true

action :create do
  path = new_resource.path
  source = new_resource.source

  package 'curl'

  template "#{path}.downloading" do
    source 'background_download.sh.erb'
    cookbook 'background_download'
    sensitive true
    mode '0700'
    variables(
              file: path,
              url: source
            )
    not_if { ::File.exist?(path) }
  end

  execute "#{path}.downloading &" do
    not_if { ::File.exist?(path) }
  end
end
