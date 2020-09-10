class Chef::Recipe::BackgroundDownload
  def self.completed?(file)
    ::File.exist?(file) && !::File.exist?("#{file}.downloading")
  end
end
