package 'beanstalkd'

template '/etc/default/beanstalkd' do
    source 'beanstalkd.erb'
    owner 'root'
    group 'root'
    mode 0640
    notifies :restart, 'service[beanstalkd]'
end

service 'beanstalkd' do
    supports [:start, :stop, :status]
    action [:enable, :start]
end
