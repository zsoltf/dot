include:
  - .repo

salt-minion:
  pkg.latest:
    - fromrepo: SaltStack Debian Repo
    - refresh: True
