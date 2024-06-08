# A brief history

This repository was made to keep my personal backup scripts. Since he accidentally destroyed his SSD and all installed O.S's, i felt the need to create some scripts to easily reinstall my stuff (basic env for development), this is a beginning and all contributions are welcome.

## Executing the script

Open the terminal in the cloned repository folder and execute:

```
% make backup
```

## Git general configuration

```
% cd git_config
```

set data on .cache.mk, then:

```
% make set_git_global_config
```

to add new sshkey:

```
% make gen_sshkey
% make touch_sshkey
```

## Config github ssh key

- https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent
