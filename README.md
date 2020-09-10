# background_download cookbook

This cookbook is used to download large files without blocking on them. It provides a custom resource `background_download` and the `BackgroundDownload::completed?` method.

## Prerequisites

The cookbook installs `curl` and is currently only supported on Linux.

## Custom Resource

This resource shells out to a script that wraps a `curl` download with a file for tracking progress. Upon completion the progress file is removed, indicating that the download has completed.

```
background_download PATH_TO_FILE do
    source URL
end
```

### Actions

`:create` Default. Download a file in the background. If the file already exists it does not attempt to download again.

`:nothing` This resource block does not act unless notified by another resource to take action. Once notified, this resource block either runs immediately or is queued up to run at the end of a Chef Infra Client run.

### Properties

`path` The full path to the file, including the file name and its extension. Default value: the name of the resource block.

## Method

The `BackgroundDownload::completed?` method may be used for `not_if` or `only_if` blocks so other resources will know if the download has completed.

Example:
```
execute 'burn iso' do
  command '/root/burn.sh /var/cache/downloads/archlinux-2020.08.01-x86_64.iso'
  only_if { BackgroundDownload::completed?('/var/cache/downloads/archlinux-2020.08.01-x86_64.iso') }
  action :run
end

```
