### To change the PostgresSQL user's password, follow these steps:

1. log in into the psql console:
```shell
sudo -u postgres psql
```
1. Then in the psql console, change the password and quit:
```shell
postgres=# \password postgres
Enter new password: <new-password>
postgres=# \q
```

### Using a query:
```shell
ALTER USER postgres PASSWORD '<new-password>';
```

Or in one line

```shell
sudo -u postgres psql -c "ALTER USER postgres PASSWORD '<new-password>';"
```

Then restart the server:

```shell
sudo service postgresql restart
```
