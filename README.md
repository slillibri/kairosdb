Skeleton for the kairosdb cookbook following the Pagoda-Chef Pattern

### Supported Platforms
- SmartOS
- Ubuntu
- CentOS


## Attributes
| Name                 | Default Value        |
| -------------------- | -------------------- |
| `install_type`       | `package`            |
| `version`            | `1.0.0`              |

## Recipes

### default

Default recipe is simply a wrapper for either source or package.  It will verify that the platform is supported and will require another recipe depending on the installation type.

### [platform]_package

Adds any necessary repositories and installs a binary package.

### [platform]_source

Installs build tools and compiles application from source.

### [platform]_build

Calls the [platform]_source recipe and then creates a package.

### [platform_family]_[install_type]

Contains logic generic to the entire platform family.

## License

This project is released under the [MIT License](http://www.opensource.org/licenses/MIT).
