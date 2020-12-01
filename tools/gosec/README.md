# gosec
Scan Go code for vulnerabilities

## Usage
To scan local repository will require mounting the project's base directory with 
```bash
docker run -v $PWD:/SEC:ro,Z quay.io/open-cluster-management/sec:latest gosec [OPTIONS]
```

or if using the [local configuration](../../README.md#local-configuration), simply
```bash
gosec [OPTIONS]
```

#### Example
From the base directory of your project, enter
```
gosec ./...
```


#### Full Options

```bash
gosec - Golang security checker

gosec analyzes Go source code to look for common programming mistakes that
can lead to security problems.

VERSION: dev
GIT TAG: 
BUILD DATE: 

USAGE:

        # Check a single package
        $ gosec $GOPATH/src/github.com/example/project

        # Check all packages under the current directory and save results in
        # json format.
        $ gosec -fmt=json -out=results.json ./...

        # Run a specific set of rules (by default all rules will be run):
        $ gosec -include=G101,G203,G401  ./...

        # Run all rules except the provided
        $ gosec -exclude=G101 $GOPATH/src/github.com/example/project/...


OPTIONS:

  -conf string
        Path to optional config file
  -confidence string
        Filter out the issues with a lower confidence than the given value. Valid options are: low, medium, high (default "low")
  -exclude string
        Comma separated list of rules IDs to exclude. (see rule list)
  -exclude-dir value
        Exclude folder from scan (can be specified multiple times)
  -fmt string
        Set output format. Valid options are: json, yaml, csv, junit-xml, html, sonarqube, golint or text (default "text")
  -include string
        Comma separated list of rules IDs to include. (see rule list)
  -log string
        Log messages to file rather than stderr
  -no-fail
        Do not fail the scanning, even if issues were found
  -nosec
        Ignores #nosec comments when set
  -nosec-tag string
        Set an alternative string for #nosec. Some examples: #dontanalyze, #falsepositive
  -out string
        Set output file for results
  -quiet
        Only show output when errors are found
  -severity string
        Filter out the issues with a lower severity than the given value. Valid options are: low, medium, high (default "low")
  -sort
        Sort issues by severity (default true)
  -tags string
        Comma separated list of build tags
  -tests
        Scan tests files
  -version
        Print version and quit with exit code 0


RULES:

        G101: Look for hardcoded credentials
        G102: Bind to all interfaces
        G103: Audit the use of unsafe block
        G104: Audit errors not checked
        G106: Audit the use of ssh.InsecureIgnoreHostKey function
        G107: Url provided to HTTP request as taint input
        G108: Profiling endpoint is automatically exposed
        G109: Converting strconv.Atoi result to int32/int16
        G110: Detect io.Copy instead of io.CopyN when decompression
        G201: SQL query construction using format string
        G202: SQL query construction using string concatenation
        G203: Use of unescaped data in HTML templates
        G204: Audit use of command execution
        G301: Poor file permissions used when creating a directory
        G302: Poor file permissions used when creation file or using chmod
        G303: Creating tempfile using a predictable path
        G304: File path provided as taint input
        G305: File path traversal when extracting zip archive
        G306: Poor file permissions used when writing to a file
        G307: Unsafe defer call of a method returning an error
        G401: Detect the usage of DES, RC4, MD5 or SHA1
        G402: Look for bad TLS connection settings
        G403: Ensure minimum RSA key length of 2048 bits
        G404: Insecure random number source (rand)
        G501: Import blocklist: crypto/md5
        G502: Import blocklist: crypto/des
        G503: Import blocklist: crypto/rc4
        G504: Import blocklist: net/http/cgi
        G505: Import blocklist: crypto/sha1
        G601: Implicit memory aliasing in RangeStmt

```

**For more information, see project [documentation](https://github.com/securego/gosec/blob/master/README.md) **
