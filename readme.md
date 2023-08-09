Testing for development of new opa policies

## CLI 

To test, use `opa eval` with the following options:
* `-d data_file.json`  # one or more data / policy files
* `-i input_file.json`

Example:

`opa eval -d rbac.rego -i input.json -d roles/data.json "data.rbac" --format pretty`

where 

* `input.json` is the request being evaluated
* `data.json` is the data available to OPA for evaluating the request 
* `rbac.rego` is the policy
* `data.rbac` is what's being output. You can limit the output to subsections, e.g. `data.rbac.allow`


## Running tests

`opa test rbac`

runs all of the tests found in the `rbac` dir. Use `-v` for verbose mode. 

`opa test .`

runs all of the tests in the current dir

## Dev notes

* the data files must be named `data.json`. If you have multiple data files, put them in separate directories. 

## Useful resources

* [Rego playground](https://play.openpolicyagent.org/)
* [How to do temporal reasoning with OPA](https://github.com/mhausenblas/temporal-opa)
* [rego unit testing](https://www.styra.com/blog/rego-unit-testing/)
* [rego cheat sheet](https://github.com/shubhi-8/RegoCheatSheetExamples)