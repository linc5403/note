# flake8
<!-- toc -->

- [flake8 configuration](#flake8-configuration)
- [git pre-commit](#git-pre-commit)

<!-- tocstop -->
### flake8 configuration
flake8在pip里面安装
~/.config/flake8  

```
[flake8]
ignore = E501, E265
exclude =
    .git,
    __pycache__,
builtins = "_"
```
[top](#flake8)

### git pre-commit

`flake8 --install-hook=git`

`git config --bool flake8.strict true`

.git/hooks/pre-commit

```
#!/home/hunch/.pyenv/shims/python
import os
import sys

from flake8.main import git

if __name__ == '__main__':
    sys.exit(
        git.hook(
            strict=git.config_for('strict'),
            lazy=git.config_for('lazy'),
        )
    )

```
[top](#flake8)
