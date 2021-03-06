node.default["exampleName"]["companyName"] = "in-line Recipe Attribute"
node.default["exampleName"]["productList"] = ["Product X", "Product Y"]

package "INSTALL PACKAGE" do
    action :install # action property
    case node[:platform_family] # Checks the platform, runs appropriate package_name
        when 'rhel'
            package_name 'httpd'
        when 'debian'
            package_name 'apache2'
    end
end

service "RUN SERVICE" do
    action [:start, :enable] # action property
    case node[:platform_family] # Checks the platform, runs the appropriate service_name
        when 'rhel'
            service_name 'httpd'
        when 'debian'
            service_name 'apache2'
    end
end

# Resource Type: file 
# 'name' property is the path
file 'path/to/index.html/here' do
    content '<h1>Hello world</h1>' # \
    mode '0755'                    #  \
    owner 'pc_admin_id_here'       #   => Properties
    group 'pc_admin_id_here'       #  /
end

template 'path/to/.erb/file/here' do # example: /home/ubuntu/workspace/mycompany.html
    source 'mycompany.html.erb'
    mode '0755'
    owner 'pc_admin_id_here'
    group 'pc_admin_id_here'
    variables ({
        :companyName => node["exampleName"]["companyName"],
        :productList => node["exampleName"]["productList"],
        :premium => true
    })
end

cookbook_file '/path/to/webpage.html/here' do
    source 'webpage.html'
end 
