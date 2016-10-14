#emacs-25.1-archive:
#  archive.extracted:
#    - archive_format: tar
#    - name: /tmp
#    - source: ftp://ftp.gnu.org/pub/gnu/emacs/emacs-25.1.tar.gz
#    - source_hash: md5=95c12e6a9afdf0dcbdd7d2efa26ca42c

emacs-24-package:
  pkg.installed:
    - name: emacs24

spacemacs:
  git.latest:
    - name: https://github.com/syl20bnr/spacemacs
    - target: /home/krieger/.emacs.d
    - user: krieger
