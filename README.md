## Terraform version

```
$ terraform -v
Terraform v0.15.0
on linux_amd64

Your version of Terraform is out of date! The latest version
is 0.15.3. You can update by downloading from https://www.terraform.io/downloads.html
```

## Getting Start

```
 $ cp services/bakend/staging/main.sample.tf services/bakend/staging/main.tf
 $ make staging ARG=init
 $ make staging # <--- terraform plan
 $ make staging ARGS=apply
```

## Must be run twice during initial build 

- The first time I run it, I get the following error (if this problem can be solved, please give me a PR or a solution) 

```
╷
│ Error: Provider produced inconsistent final plan
│ 
│ When expanding the plan for module.terraform_alb.module.alb.aws_lb.this[0] to include new values learned so far during apply, provider
│ "registry.terraform.io/hashicorp/aws" produced an invalid new value for .access_logs[0].bucket: was cty.StringVal(""), but now
│ cty.StringVal("alb-logs-newsdict-staging").
│ 
│ This is a bug in the provider, which should be reported in the provider's own issue tracker.
```