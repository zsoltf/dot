users:
  lookup:
    Windows:
      present:
        Kryten:
          password: sekrit
        krieger:
          password: pigley
      absent:
        - test
    Debian:
      present:
        krieger:
          # openssl passwd -1
          password: $1$6aMu5hk2$usziPZ9VxgVm2uJJkxO1z0
