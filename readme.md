After pulling the repository, run the following command to initialize and update submodules:
```bash
git submodule update --init --recursive
```
Then put the following code into .git/hooks/pre-commit

```bash
#!/bin/sh
echo "Push disabled on this machine."
exit 1
```
