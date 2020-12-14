# gitleaks
Scan repositories for secrets and sensitive information

## Usage
To scan local repository will require mounting the project's base directory with 
```bash
docker run -v $PWD:/SEC:ro,Z quay.io/open-cluster-management/sec:latest gitleaks [OPTIONS]
```

or if using the [local configuration](../../README.md#local-configuration), simply
```bash
gitleaks [OPTIONS]
```
#### Example
From the base directory of your project, simply using the command 
```
gitleaks
```
is a great starting point.


#### Full options
```bash

Application Options:
  -v, --verbose           Show verbose output from scan
  -r, --repo=             Target repository
      --config=           config path
      --disk              Clones repo(s) to disk
      --version           version number
      --username=         Username for git repo
      --password=         Password for git repo
      --access-token=     Access token for git repo
      --files-at-commit=  sha of commit to scan all files at commit
      --threads=          Maximum number of threads gitleaks spawns
      --ssh-key=          path to ssh key used for auth
      --uncommitted       run gitleaks on uncommitted code
      --repo-path=        Path to repo
      --owner-path=       Path to owner directory (repos discovered)
      --branch=           Branch to scan
      --report=           path to write json leaks file
      --report-format=    json, csv, sarif (default: json)
      --redact            redact secrets from log messages and leaks
      --debug             log debug messages
      --repo-config       Load config from target repo. Config file must be
                          ".gitleaks.toml" or "gitleaks.toml"
      --pretty            Pretty print json if leaks are present
      --commit=           sha of commit to scan or "latest" to scan the last
                          commit of the repository
      --commits=          comma separated list of a commits to scan
      --commits-file=     file of new line separated list of a commits to scan
      --commit-from=      Commit to start scan from
      --commit-to=        Commit to stop scan
      --commit-since=     Scan commits more recent than a specific date. Ex:
                          '2006-01-02' or '2006-01-02T15:04:05-0700' format.
      --commit-until=     Scan commits older than a specific date. Ex:
                          '2006-01-02' or '2006-01-02T15:04:05-0700' format.
      --timeout=          Time allowed per scan. Ex: 10us, 30s, 1m, 1h10m1s
      --depth=            Number of commits to scan
      --include-deletion  Scan for patch deletions in addition to patch
                          additions
      --host=             git hosting service like gitlab or github. Supported
                          hosts include: Github, Gitlab
      --baseurl=          Base URL for API requests. Defaults to the public
                          GitLab or GitHub API, but can be set to a domain
                          endpoint to use with a self hosted server.
      --org=              organization to scan
      --user=             user to scan
      --pr=               pull/merge request url
      --exclude-forks     scan excludes forks

Help Options:
  -h, --help              Show this help message
```

## Pre-commit Hook
Use this pre-commit hook (based on [this](https://github.com/zricethezav/gitleaks/wiki/Scanning#uncommitted-changes-scan) from Gitleaks) to help prevent
sensitive information from getting committed. 

To add a pre-commit-hook you should add the following to (repo)/.git/hooks/pre-commit:
```bash
#!/bin/sh
# This is an example of what adding gitleaks to a pre-commit hook would look like.

gitleaksEnabled=$(git config --bool hooks.gitleaks)
cmd="docker run -v $PWD:/SEC:ro,Z quay.io/open-cluster-management/sec:latest gitleaks --verbose --redact --pretty"
if [ "$gitleaksEnabled" = "true" ]; then
    $cmd
    if [ $? -eq 1 ]; then
cat <<\EOF
Error: gitleaks has detected sensitive information in your changes.
If you know what you are doing you can disable this check using:
    git config hooks.gitleaks false
EOF
exit 1
    fi
fi
```

Make sure to run the command
```bash
git config hooks.gitleaks true
```
to enable the hook.


**See project [documentation](https://github.com/zricethezav/gitleaks/wiki) for more information**


## So leaks were detected in your project...
__Don't Panic!__

Look through the findings. Assume any credentials or other secrets found are compromised. If you are the administrator of the account that owns the credential, destroy it. If you are not, reach out to the administrator so that they may do so.

_If you are certain these are false positives_, just document that. Let us know what's getting falsely identified and we can modify our configuration to minimize the same finding from showing up again.
