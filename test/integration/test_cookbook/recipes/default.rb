file1 = '/tmp/archlinux-2020.08.01-x86_64.iso'
file2 = '/tmp/archlinux-2020.09.01-x86_64.iso'
url1 = 'https://10.0.0.1:8001/fbsharing/NBbPRKKa'
url2 = 'https://10.0.0.1:8001/fbsharing/XuQsB6xj'

background_download file1 do
  source url1
end

background_download file2 do
  source url2
end

log "FILE #{file1} COMPLETED DOWNLOAD" do
  only_if { BackgroundDownload.completed?(file1) }
end

log "FILE #{file2} COMPLETED DOWNLOAD" do
  only_if { BackgroundDownload.completed?(file2) }
end
