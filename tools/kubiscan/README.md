# KubiScan
### Scan Kubernetes Roles for Risky Permissions

## Usage
```bash
kubiscan [OPTIONS]
```

**Note:** You must be logged into the cluster using `oc login` as opposed to using the `KUBECONFIG` environment variable for `kubiscan` to properly resolve your environments configuration.

#### Examples
```
kubiscan -rr
```
to do a scan of risky roles in the current cluster.

```
kubiscan -rcr
```
to do a scan of risky clusterroles in the current cluster.

#### Full options

```bash
usage: KubiScan.py [options...]

This tool can get information about risky roles\clusterroles, rolebindings\clusterrolebindings, users and pods.
Use "KubiScan.py -h" for help or "KubiScan.py -e" to see examples.
Requirements:
    - Python 3
    - Kubernetes python client (https://github.com/kubernetes-client/python)
      Can be installed:
            From source:
                git clone --recursive https://github.com/kubernetes-client/python.git
                cd python
                python setup.py install
            From PyPi directly:
                pip3 install kubernetes
    - Prettytable
        pip3 install PTable


KubiScan.py - script used to get information on risky permissions on
Kubernetes

optional arguments:
  -h, --help            show this help message and exit
  -rr, --risky-roles    Get all risky Roles (can be used with -r to view
                        rules)
  -rcr, --risky-clusterroles
                        Get all risky ClusterRoles (can be used with -r to
                        view rules)
  -rar, --risky-any-roles
                        Get all risky Roles and ClusterRoles
  -rb, --risky-rolebindings
                        Get all risky RoleBindings
  -rcb, --risky-clusterrolebindings
                        Get all risky ClusterRoleBindings
  -rab, --risky-any-rolebindings
                        Get all risky RoleBindings and ClusterRoleBindings
  -rs, --risky-subjects
                        Get all risky Subjects (Users, Groups or Service
                        Accounts)
  -rp, --risky-pods     Get all risky Pods\Containers. Use the -d\--deep
                        switch to read the tokens from the current running
                        containers
  -d, --deep            Works only with -rp\--risky-pods switch. If this is
                        specified, it will execute each pod to get its token.
                        Without it, it will read the pod mounted service
                        account secret from the ETCD, it less reliable but
                        much faster.
  -pp, --privleged-pods
                        Get all privileged Pods\Containers.
  -a, --all             Get all risky Roles\ClusterRoles,
                        RoleBindings\ClusterRoleBindings, users and
                        pods\containers
  -jt, --join-token     Get join token for the cluster. OpenSsl must be
                        installed + kubeadm
  -psv, --pods-secrets-volume
                        Show all pods with access to secret data throught a
                        Volume
  -pse, --pods-secrets-env
                        Show all pods with access to secret data throught a
                        environment variables
  -ctx CONTEXT, --context CONTEXT
                        Context to run. If none, it will run in the current
                        context.
  -p PRIORITY, --priority PRIORITY
                        Filter by priority (CRITICAL\HIGH\LOW)

Helper switches:
  -lt NUMBER, --less-than NUMBER
                        Used to filter object exist less than X days.
                        Supported on Roles\ClusterRoles and
                        RoleBindings\ClusterRoleBindings.IMPORTANT: If object
                        does not have creation time (usually in
                        ClusterRoleBindings), omit this switch to see it.
  -ns NAMESPACE, --namespace NAMESPACE
                        If present, the namespace scope that will be used
  -k KIND, --kind KIND  Kind of the object
  -r, --rules           Show rules. Supported only on pinrting risky
                        Roles\ClusterRoles.
  -e, --examples        Show examples.
  -n NAME, --name NAME  Name

Dumping tokens:
  Use the switches: name (-n\--name) or namespace (-ns\ --namespace)

  -dt, --dump-tokens    Dump tokens from pod\pods Example: -dt OR -dt -ns
                        "kube-system" -dt -n "nginx1" -ns "default"

Remote switches:
  -ho <MASTER_IP>:<PORT>, --host <MASTER_IP>:<PORT>
                        Host contain the master ip and port. For example:
                        10.0.0.1:6443
  -c CA_FILENAME, --cert-filename CA_FILENAME
                        Certificate authority path ('/../ca.crt'). If not
                        specified it will try without SSL verification. Inside
                        Pods the default location is '/var/run/secrets/kuberne
                        tes.io/serviceaccount/ca.crt'Or
                        '/run/secrets/kubernetes.io/serviceaccount/ca.crt'.
  -t TOKEN_FILENAME, --token-filename TOKEN_FILENAME
                        A bearer token. If this token does not have the
                        required permissions for this application,the
                        application will faill to get some of the information.
                        Minimum required permissions: - resources: ["roles",
                        "clusterroles", "rolebindings", "clusterrolebindings",
                        "pods", "secrets"] verbs: ["get", "list"] - resources:
                        ["pods/exec"] verbs: ["create"]

Associated RoleBindings\ClusterRoleBindings to Role:
  Use the switch: namespace (-ns\--namespace).

  -aarbr ROLE_NAME, --associated-any-rolebindings-role ROLE_NAME
                        Get associated RoleBindings\ClusterRoleBindings to a
                        specific role Example: -aarbr "read-secrets-role" -ns
                        "default"

Associated RoleBindings\ClusterRoleBindings to ClusterRole:
  -aarbcr CLUSTERROLE_NAME, --associated-any-rolebindings-clusterrole CLUSTERROLE_NAME
                        Get associated RoleBindings\ClusterRoleBindings to a
                        specific role Example: -aarbcr "read-secrets-
                        clusterrole"

Associated RoleBindings\ClusterRoleBindings to Subject (user, group or service account):
  Use the switches: namespace (-ns\--namespace) and kind (-k\--kind).

  -aarbs SUBJECT_NAME, --associated-any-rolebindings-subject SUBJECT_NAME
                        Get associated Rolebindings\ClusterRoleBindings to a
                        specific Subject (user, group or service account)
                        Example: -aarbs "system:masters" -k "Group"

Associated Roles\ClusterRoles to Subject (user, group or service account):
  Use the switches: namespace (-ns\--namespace) and kind (-k\--kind).

  -aars SUBJECT_NAME, --associated-any-roles-subject SUBJECT_NAME
                        Get associated Roles\ClusterRoles to a specific
                        Subject (user, group or service account) Example:
                        -aars "generic-garbage-collector" -k "ServiceAccount"
                        -ns "kube-system"

List Subjects:
  -su, --subject-users  Get Subjects with User kind
  -sg, --subject-groups
                        Get Subjects with Group kind
  -ss, --subject-serviceaccounts
                        Get Subjects with ServiceAccount kind

List rules of RoleBinding\ClusterRoleBinding:
  -rru ROLEBINDING_NAME, --rolebinding-rules ROLEBINDING_NAME
                        Get rules of RoleBinding
  -crru CLUSTERROLEBINDING_NAME, --clusterrolebinding-rules CLUSTERROLEBINDING_NAME
                        Get rules of ClusterRoleBinding
```


**See project [documentation](https://github.com/cyberark/KubiScan) for more information**
**See CyberArk [blog](https://www.cyberark.com/resources/threat-research-blog/securing-kubernetes-clusters-by-eliminating-risky-permissions) for more information**
