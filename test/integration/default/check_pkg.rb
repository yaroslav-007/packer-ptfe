####Test OS
describe os.name do
  it { should eq 'ubuntu' }
end

describe os.release do
  it { should eq '18.04' }
end


describe filesystem('/') do
  its('free_kb') { should be >= 10 * 1024 }
  its('type') { should cmp 'ext4' }
end

describe filesystem('/var/lib') do
  its('free_kb') { should be >= 40 * 1024 }
  its('type') { should cmp 'ext4' }
end