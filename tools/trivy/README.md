# trivy
Scans for vulnerable dependencies in images and project files

## Usage
With the diversity of use cases covered by trivy, it is highly recommended to use the functions and aliases provided by the [local configuration](../../README.md#local-configuration). See examples below for typical usage.

```
trivy [global options] command [command options] target
```


#### Examples

##### Scanning Project Dependencies
From the project's base directory, use the alias provided by local configuration
```
trivy-fs .
```

##### Scanning Image on Local Machine
Use function provided by local configuration
```
trivy-image [IMAGE_NAME]:[IMAGE_TAG]
```

##### Scanning Remote Image
```
trivy i --ignore-unfixed [IMAGE_NAME]:[IMAGE_TAG]
```

#### Full Options
```
COMMANDS:
   image, i          scan an image
   filesystem, fs    scan local filesystem
   repository, repo  scan remote repository
   client, c         client mode
   server, s         server mode
   help, h           Shows a list of commands or help for one command

GLOBAL OPTIONS:
   --quiet, -q        suppress progress bar and log output (default: false) [$TRIVY_QUIET]
   --debug, -d        debug mode (default: false) [$TRIVY_DEBUG]
   --cache-dir value  cache directory (default: "/root/.cache/trivy") [$TRIVY_CACHE_DIR]
   --help, -h         show help (default: false)
   --version, -v      print the version (default: false)
```





Refer to the [main documentation](https://github.com/aquasecurity/trivy/blob/master/README.md) for more information
