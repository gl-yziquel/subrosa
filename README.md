subrosa.
========

Management of SSL certificates.


Synopsis:
---------

We provide a `subrosa` executable Justfile, able to [generate SSL root
certificates][root]. We expect in the near future to be able to sign
derived certificates with it.

The structure of this project as an executable Justfile is in line with
the [`ogma`][ogma] tool for electronic mail. (Tool which incidentally should
be renamed to avoid conflict with a range of preexisting tools.)

[ogma]: https://github.com/gl-yziquel/ogma
[root]: https://gist.github.com/fntlnz/cf14feb5a46b2eda428e000157447309


Installation instructions:
--------------------------

* Write up an `Install.toml` file with an `install.path` field.

* Run `just install`, and the path declared above will be a symbolic
link to the `subrosa` executable Justfile in this repository.

Here is an example `Install.toml` file:

```toml
[install]
path = "~/.local/bin"
```


Usage instructions:
-------------------

* `subrosa root` will generate a root key in `.subrosa/rootCA.key` and a
root certificate `.subrosa/rootCA.crt` tied to this key. The passphrase
of the key will be generated and stored in a `pass` password store
located at `.subrosa/pass` in the `passphrase` path. The generation of
the root certificate will require a `subrosa.conf` file instructing
openssl about metadata of the certificate to be generated.

* `subrosa wipe` will wipe out the whole data, located in `.subrosa`.

Here is an example of the `subrosa.conf` file:

```ini
[req]
prompt = no
distinguished_name = dn

[dn]
countryName = US
stateOrProvince = NY
localityName = New York
organizationName = S.H.I.E.L.D.
organizationalUnitName = Executive Board
commonName = presidency.shield.gov
emailAddress = nick.fury@shield.gov
```


Considerations about requirements:
----------------------------------

The `subrosa` executable Justfile will require the `pass` tool. Support
for analogue tools, such as [`hunter2`][hunter2] would not be unworthy.
May be useful for yubikeys. Ideally, `pass` data should be thrown into a
Veracrypt container.

[hunter2]: https://chiselapp.com/user/rkeene/repository/hunter2/doc/trunk/README.md

Naming: The executable Justfile is named `subrosa`, in reference to
the middle age custom of [suspending a rose][subrosa] from the ceiling
of council chambers to highlight the secrecy of such deliberations.
This finds its mythological origins in the story of Aphrodites giving a
rose to her son Eros, which in turn gave it to Harpocrates, a deity of
secrets, in charge of keeping the sexual or romantic indiscretions of
Aphrodites under wraps.

[subrosa]: https://en.wikipedia.org/wiki/Sub_rosa
