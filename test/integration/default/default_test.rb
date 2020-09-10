describe file('/tmp/archlinux-2020.08.01-x86_64.iso.downloading') do
  it { should_not exist }
end

describe file('/tmp/archlinux-2020.09.01-x86_64.iso.downloading') do
  it { should_not exist }
end

describe file('/tmp/archlinux-2020.08.01-x86_64.iso') do
  it { should exist }
  its('md5sum') { should eq 'cd918e38b3d468de98c1a523990500ef' }
end

describe file('/tmp/archlinux-2020.09.01-x86_64.iso') do
  it { should exist }
  its('md5sum') { should eq 'ebcdb2223a77f098af3923fe1fa180aa' }
end
