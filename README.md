# secure-engineering-container
Container packed with secure engineering tools and automation

## Installation
It is recommended that the dynamically tagged image available on Quay is used, thus keeping tools up-to-date throughout development.
```bash
docker pull quay.io/open-cluster-management/sec:latest
```

### Building Locally
If desired, the image can be built locally by cloning this repository and running
```bash
docker build -t quay.io/open-cluster-management/sec:latest .
```
Docker or podman will be required on your local system.

## Local Configuration

Many of the tools provided require volume mounts or other tool-specific configurations to work properly. To make it easier to run the tools without worrying about these settings, aliases and functions have been written and are available using the `local` command. Using a redirect to save this to a file allows these to be imported into your current shell session.

```bash
docker run quay.io/open-cluster-management/sec local > /tmp/sec-local
source /tmp/sec-local
```

Details on the provided aliases and functions will be found in the provided documentation for each tool.

Note: If using podman, make sure an alias exists such as
```bash
alias docker=podman
```
for provided local functions to work properly. 

## Quick Start
I want to...
    
- **Scan code for vulnerabilities**
    - Go: see [Gosec](tools/gosec/README.md)
    - Python: see [Bandit](tools/bandit/README.md)
    - NodeJS: see [njsscan](tools/njsscan/README.md)
- **Scan repo for sensitive information**
    - see [Gitleaks](tools/gitleaks/README.md)
- **Scan project for vulnerable dependencies**
    - Go: see [nancy](tools/nancy/README.md)
    - Otherwise see [trivy](tools/trivy/README.md)
- **Scan image for vulnerabilties**
    - See [trivy](tools/trivy/README.md)
- **Scan Kubernetes deployments for security risks**
    - See [kubesec](tools/kubesec/README.md)
- **Scan Kubernetes RBAC for usage of risky roles**
    - See [kubiscan](tools/kubiscan/README.md)
- **Network exploration tool and security / port scanner**
    - See [nmap](tools/nmap/README.md)


## Adding New Tools to SEC
New tools can be added by creating a new directory in the tools directory and adding the files from the template directory. These include
- Build - For any compiled code, build instructions should be added here
- Install - Any installation steps, including installing package dependencies, that need to happen in the base image
- local - Any aliases or functions that make using the tool easier locally
- test - Commands to test successful installation of the tool
