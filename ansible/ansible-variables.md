# Using Variables in Ansible

lets see content of plybook

var , task, files , templates, modules , handlers,

```yml
vars:
  var_name: value
```

usage

result : ' {{var_name}} '

another way to define variable as array

```yaml
vars:
  array:
    - num1
    - num2
    - num3
```

we can also pass in plybook
like

ansible-playbook play.yaml -e var=value -become
