name 'background_download'

default_source :supermarket

# test harness
cookbook 'test_cookbook', path: 'test/integration/test_cookbook/'

cookbook 'background_download', path: '.'

run_list 'test_cookbook'
