# background_download CHANGELOG

This file is used to list changes made in each version of the background_download cookbook.

## 0.1.0

Initial release.

- custom resource `background_download`
- helper method `BackgroundDownload::completed?`

## BACKLOG

`group` A string identifying the file group owner by name.
`mode` A quoted 3-5 character string that defines the octal mode.
`options` Any additional CLI options that may need to be passed to the  `curl` command.
`owner` A string identifying the file owner by user name.
