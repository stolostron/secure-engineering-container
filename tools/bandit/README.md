# Bandit
### Scan Python code for vulnerabilities 

## Usage
To scan local repository will require mounting the project's base directory with 
```bash
docker run -v $PWD:/SEC:ro,Z quay.io/open-cluster-management/sec:latest bandit [OPTIONS]
```

or if using the [local configuration](../../README.md#local-configuration), simply
```bash
bandit [OPTIONS]
```

#### Example
From the base directory of your project use
```
bandit -r .
```
to do a scan of the project.

#### Full options

```bash
usage: bandit [-h] [-r] [-a {file,vuln}] [-n CONTEXT_LINES] [-c CONFIG_FILE]
              [-p PROFILE] [-t TESTS] [-s SKIPS] [-l] [-i]
              [-f {csv,custom,html,json,screen,txt,xml,yaml}]
              [--msg-template MSG_TEMPLATE] [-o [OUTPUT_FILE]] [-v] [-d] [-q]
              [--ignore-nosec] [-x EXCLUDED_PATHS] [-b BASELINE]
              [--ini INI_PATH] [--version]
              [targets [targets ...]]

Bandit - a Python source code security analyzer

positional arguments:
  targets               source file(s) or directory(s) to be tested

optional arguments:
  -h, --help            show this help message and exit
  -r, --recursive       find and process files in subdirectories
  -a {file,vuln}, --aggregate {file,vuln}
                        aggregate output by vulnerability (default) or by
                        filename
  -n CONTEXT_LINES, --number CONTEXT_LINES
                        maximum number of code lines to output for each issue
  -c CONFIG_FILE, --configfile CONFIG_FILE
                        optional config file to use for selecting plugins and
                        overriding defaults
  -p PROFILE, --profile PROFILE
                        profile to use (defaults to executing all tests)
  -t TESTS, --tests TESTS
                        comma-separated list of test IDs to run
  -s SKIPS, --skip SKIPS
                        comma-separated list of test IDs to skip
  -l, --level           report only issues of a given severity level or higher
                        (-l for LOW, -ll for MEDIUM, -lll for HIGH)
  -i, --confidence      report only issues of a given confidence level or
                        higher (-i for LOW, -ii for MEDIUM, -iii for HIGH)
  -f {csv,custom,html,json,screen,txt,xml,yaml}, --format {csv,custom,html,json,screen,txt,xml,yaml}
                        specify output format
  --msg-template MSG_TEMPLATE
                        specify output message template (only usable with
                        --format custom), see CUSTOM FORMAT section for list
                        of available values
  -o [OUTPUT_FILE], --output [OUTPUT_FILE]
                        write report to filename
  -v, --verbose         output extra information like excluded and included
                        files
  -d, --debug           turn on debug mode
  -q, --quiet, --silent
                        only show output in the case of an error
  --ignore-nosec        do not skip lines with # nosec comments
  -x EXCLUDED_PATHS, --exclude EXCLUDED_PATHS
                        comma-separated list of paths (glob patterns
                        supported) to exclude from scan (note that these are
                        in addition to the excluded paths provided in the
                        config file)
  -b BASELINE, --baseline BASELINE
                        path of a baseline report to compare against (only
                        JSON-formatted files are accepted)
  --ini INI_PATH        path to a .bandit file that supplies command line
                        arguments
  --version             show program's version number and exit

CUSTOM FORMATTING
-----------------

Available tags:

    {abspath}, {relpath}, {line},  {test_id},
    {severity}, {msg}, {confidence}, {range}

Example usage:

    Default template:
    bandit -r examples/ --format custom --msg-template \
    "{abspath}:{line}: {test_id}[bandit]: {severity}: {msg}"

    Provides same output as:
    bandit -r examples/ --format custom

    Tags can also be formatted in python string.format() style:
    bandit -r examples/ --format custom --msg-template \
    "{relpath:20.20s}: {line:03}: {test_id:^8}: DEFECT: {msg:>20}"

    See python documentation for more information about formatting style:
    https://docs.python.org/3.4/library/string.html

The following tests were discovered and loaded:
-----------------------------------------------
        B101    assert_used
        B102    exec_used
        B103    set_bad_file_permissions
        B104    hardcoded_bind_all_interfaces
        B105    hardcoded_password_string
        B106    hardcoded_password_funcarg
        B107    hardcoded_password_default
        B108    hardcoded_tmp_directory
        B110    try_except_pass
        B112    try_except_continue
        B201    flask_debug_true
        B301    pickle
        B302    marshal
        B303    md5
        B304    ciphers
        B305    cipher_modes
        B306    mktemp_q
        B307    eval
        B308    mark_safe
        B309    httpsconnection
        B310    urllib_urlopen
        B311    random
        B312    telnetlib
        B313    xml_bad_cElementTree
        B314    xml_bad_ElementTree
        B315    xml_bad_expatreader
        B316    xml_bad_expatbuilder
        B317    xml_bad_sax
        B318    xml_bad_minidom
        B319    xml_bad_pulldom
        B320    xml_bad_etree
        B321    ftplib
        B322    input
        B323    unverified_context
        B324    hashlib_new_insecure_functions
        B325    tempnam
        B401    import_telnetlib
        B402    import_ftplib
        B403    import_pickle
        B404    import_subprocess
        B405    import_xml_etree
        B406    import_xml_sax
        B407    import_xml_expat
        B408    import_xml_minidom
        B409    import_xml_pulldom
        B410    import_lxml
        B411    import_xmlrpclib
        B412    import_httpoxy
        B413    import_pycrypto
        B501    request_with_no_cert_validation
        B502    ssl_with_bad_version
        B503    ssl_with_bad_defaults
        B504    ssl_with_no_version
        B505    weak_cryptographic_key
        B506    yaml_load
        B507    ssh_no_host_key_verification
        B601    paramiko_calls
        B602    subprocess_popen_with_shell_equals_true
        B603    subprocess_without_shell_equals_true
        B604    any_other_function_with_shell_equals_true
        B605    start_process_with_a_shell
        B606    start_process_with_no_shell
        B607    start_process_with_partial_path
        B608    hardcoded_sql_expressions
        B609    linux_commands_wildcard_injection
        B610    django_extra_used
        B611    django_rawsql_used
        B701    jinja2_autoescape_false
        B702    use_of_mako_templates
        B703    django_mark_safe
```


**See project [documentation](https://github.com/PyCQA/bandit/blob/master/README.rst) for more information**
