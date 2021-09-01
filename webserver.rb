package "apache2"

service "apache2" do
    action [:start, :enable]
end

file 'path/to/index.html/here' do
    content '<h1>Hello world</h1>'
    mode '0755'
    owner 'pc_admin_id_here'
    group 'pc_admin_id_here'
end