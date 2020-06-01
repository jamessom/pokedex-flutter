# Contributions

## Pull requests
The steps to contribute to the evolution of the code, whether to solve bugs or create features are as follows:

- Create a project fork
- Create a new branch
- Make changes or add features
- Commit changes and send them to the remote
- Make pull request and assign to a reviewer
- In case of revisions: make new commits in the same branch created and send to the remote

An example of a bug resolution would follow the following flow:

```shell
$ readme-template (master)> git pull origin master
$ readme-template (master)> git checkout -b bug/bug-xpto
$ readme-template (bug/bug-xpto)> git commit -a -m "Fix bug"
$ readme-template (bug/bug-xpto)> git push origin bug/bug-xpto
```

Then open a Pull Request for your modification.