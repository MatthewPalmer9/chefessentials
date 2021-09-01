# Chef Essentials Configuration Automation

## Part 1 - Hello World

### Setup
I personally followed this tutorial in a Linux VM. Start in the terminal...

| Terminal Steps               |                      Command                    |
|------------------------------|-------------------------------------------------|
| Ensure apache2 doesn't exist | `sudo apt-get remove apache2`                   |
| Update                       | `sudo apt-get update -y`                        |
| Download Chef                | `wget [latest chef version download link here]` |
| De-package Chef              | `sudo dpkg -i [chef-package-name.deb here]`     |
| Install Chef Package Apache  | `sudo chef-apply -e "package 'apache2'"`        |

### In VsCode (IDE)
| Run The Server               |                      Command                    |
|------------------------------|-------------------------------------------------|
| Run webserver.rb             | `sudo chef-apply webserver.rb`                  |

## Part 2 - Cookbook

| Terminal Steps                   |                  Command                               |
|----------------------------------|--------------------------------------------------------|
| Create cookbooks directory       | `mkdir cookbooks`                                      |
| Inside, generate cookbook        | `chef generate cookbook exampleName`                   |
| From main dir, copy webserver.rb | `cp webserver.rb cookbooks/exampleName/recipies/`      |
| Run Chef Client                  | `sudo chef-client -z -o recipe[exampleName::webserver]`|

## Part 3 - Templates