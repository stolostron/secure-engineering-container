# njsscan
Scan NodeJS code for vulnerabilities

## Usage
To scan local repository will require mounting the project's base directory with 
```bash
docker run -v $PWD:/SEC:ro,Z quay.io/open-cluster-management/sec:latest njsscan [OPTIONS]
```

or if using the [local configuration](../../README.md#local-configuration), simply
```bash
njsscan [OPTIONS]
```

#### Example
From the project's base directory, enter
```
njsscan .
```

```bash
usage: njsscan [-h] [--json] [--sarif] [--sonarqube] [-o OUTPUT]
               [--missing-controls] [-w] [-v]
               [path [path ...]]

positional arguments:
  path                  Path can be file(s) or directories with source code

optional arguments:
  -h, --help            show this help message and exit
  --json                set output format as JSON
  --sarif               set output format as SARIF 2.1.0
  --sonarqube           set output format compatible with SonarQube
  -o OUTPUT, --output OUTPUT
                        output filename to save the result
  --missing-controls    enable missing security controls check
  -w, --exit-warning    non zero exit code on warning
  -v, --version         show njsscan version
```

See project [documentation](https://github.com/ajinabraham/njsscan/blob/master/README.md) for more information
