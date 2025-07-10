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

Change fastfetch config:
first test the name of your disk by removing "prefix" in fastfetch/config.jsonc
then change it to the correct disk prefix 
