Babel
=====

- Project: <https://github.com/c4s4/babel>.
- Download: <https://github.com/c4s4/babel/releases>.

Babel is a set of tools to manage versions of your favorite programming
languages.

To download, build from sources and install GO *1.4.2*:

```bash
go-build 1.4.2
```

To use this GO version, run *version* script that will list all installed
versions and let you select one:

```bash
$ version go
Please choose a version:
0: Default
1: 1.0.3
2: 1.1.2
3: 1.2.2 *
4: 1.3.3
5: 1.4.2
5
Selecting go version '1.4.2'
$ go version
go version go1.4.2 linux/amd64
```

This tool is able to build and manage following programming languages:

- Go
- Python
- Ruby
- Java
- Lua
- Rust

How it works
------------

Build scripts builds and install VMs or compiler in directory 
*/opt/&lt;lang>/&lt;version>*. Thus GO *1.4.2* would be installed in directory
*/opt/go/1.4.2*.

Script *version* selects a given version by making a symbolic link between
*/opt/&lt;lang>/&lt;version>* and */opt/&lt;lang>/current*.

Thus, if you put directory */opt/&lt;lang>/current/bin* in your *PATH*, you 
would run selected version.

This system is straightforward and works fine.

Installation
------------

To install Babel:

- Drop scripts in *bin* directory somewhere in your *PATH*.
- Create directories for languages you want to manage (*/opt/go*, */opt/lua*,
  */opt/python*, */opt/ruby* and/or */opt/java*).
- Copy profile files in *etc* directory to */etc/profile.d/*. These scripts
  are sourced at startup and define environment variables. For instance,
  it will add */opt/&lt;lang>/current/bin* in your *PATH*.

Build your VMs with scripts *&lt;lang>-build version* (except for Java that you
install already built in appropriate directory */opt/java/&lt;version>*).

Languages
---------

### GO

GO has no VM, thus:

- *go-build* script will install a given compiler.
- *version go* script will switch between installed versions.

You must set following environment variables:

- *PATH*: must include */opt/go/current/bin*.
- *GOROOT*: must be */opt/go/current*.
- *GOPATH*: must be set as you wish (*~/go* for instance).

**Note**:

Even if tests fail (which is the case for release *1.1* for instance), the compiler is installed.

### Python

- *python-build* script will build the VM for given version.
- *version python* script will switch between installed versions.
- *python-venv* script to create a virtualenv with an installed VM.

To build Python VM, you must install following development libraries:

- *tetex-nox* and *latex2html* to generate documentation for 2.6 and earlier versions.
- *libreadline-dev* to enable completion and line edition in interpreter.
- *libssl-dev* to enable HTTPS.
- *libzip-dev*, *libtar-dev*, *libbz2-dev*, *zlib1g-dev* to enable ZIP and TAR support.
- *libmysqld-dev*, *libmysqlclient-dev* and *python-dev* to install MySQL driver.
- *libsqlite3-dev* to enable sqlite3 support.

### Ruby

- *ruby-build* script will build the VM for the given version.
- *version ruby* script will switch between installed versions.

### Java

- There is no build script: drop Java tarball content in */opt/java/&lt;version>* directory.
- *version java* script will switch between installed versions.

You must set following environment variables:

- *PATH*: must include */opt/go/current/bin*.
- *JAVA_HOME*: must be */opt/java/current*.

### Lua

- *lua-build* script will build the VM for the given version.
- *version lua* script will switch between installed versions.

### Rust

- *rust-build* script will build Rust from sources (which is *very* long).
- *version rust* script will switch between installed versions.

*Enjoy!*
