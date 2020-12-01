# nancy
Scan Go project dependencies for vulnerabilities

## Usage
Typical usage is to pipe the output of `go list -json -m all` to nancy with  
go list -json -m all | docker run -i quay.io/open-cluster-management/sec:latest nancy [OPTIONS]

or if using the [local configuration](../../README.md#local-configuration), simply
```
go list -json -m all | nancy [OPTIONS]
```

#### Example

```
go list -json -m all | nancy sleuth
```
As an alternative, in order to filter out non-production dependencies, the following command can be used. This will create a vendor directory if it does not already exist, and as such should be removed afterwards if not in use by the project.

```
go mod tidy; go mod vendor; grep -e "#" vendor/modules.txt | cut -d " " -f 2,3 | nancy sleuth
```
With the local configuration in place, the simple alias below can be used from the project's base directory
```
nancyocm
```

#### Full Options
```
Available Commands:
  config      Setup credentials to use when connecting to services
  help        Help about any command
  iq          Check for vulnerabilities in your Golang dependencies using 'Sonatype's Nexus IQ IQServer'
  sleuth      Check for vulnerabilities in your Golang dependencies using Sonatype's OSS Index

Flags:
  -v, -- count            Set log level, multiple v's is more verbose
  -c, --clean-cache       Deletes local cache directory
  -h, --help              help for nancy
      --loud              indicate output should include non-vulnerable packages
  -p, --path string       Specify a path to a dep Gopkg.lock file for scanning
  -q, --quiet             indicate output should contain only packages with vulnerabilities (default true)
  -t, --token string      Specify OSS Index API token for request
  -u, --username string   Specify OSS Index username for request
  -V, --version           Get the version

Use "nancy [command] --help" for more information about a command.
```

More information available in the project's [documentation](https://github.com/sonatype-nexus-community/nancy/blob/main/README.md)
