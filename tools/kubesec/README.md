# kubesec scan
Scan deployments for insecure configurations

## Usage
To scan local repository will require passing a deployment yaml as standard input to the docker command.
```bash
cat deployment.yaml | docker run -i -v $PWD:/SEC:ro,Z quay.io/stolostron/sec:latest kubesec scan -
```

or if using the [local configuration](../../README.md#local-configuration), simply
```bash
cat deployment.yaml | kubesec
```
#### Example
From the kubernetes namespace of your application, simply use the command 
```
kubectl get deployment <deploymentname> -o yaml | kubesec
```
as a great starting point.


#### Full options
```bash

Usage:
  kubesec scan - [flags]

Examples:
  scan - 

Flags:
      --debug   turn on debug logs
  -h, --help    help for scan

```

