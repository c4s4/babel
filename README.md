% id:     babel
% title:  Babel
% author: Michel Casabianca
% email:  michel.casabianca@gmail.com
% date:   2014-11-05
% lang:   en
% toc:    yes

Babel is a set of tools to manage versions of your favorite programming languages.

To build and install GO *1.3.3*:

```
go-build 1.3.3
```

To use this GO version, run *version* script that list all installed versions:

```
$ version go
Please choose a version:
0: Default
1: 1.0.3
2: 1.1.2
3: 1.2.2 *
4: 1.3.3
4
Selecting go version '1.3.3'
$ go version
go version go1.3.3 linux/amd64
```

This tool is able to build and manage following programming languages:

- Go
- Python
- Ruby
- Java
- Lua
- Rust

How it works
============

Build scripts builds and install VMs or compiler in directory */opt/&lt;lang>/&lt;version>*. Thus GO *1.3.3* would be installed in directory */opt/go/1.3.3*.

Script *version* selects a given version by making a symbolic link between */opt/&lt;lang>/&lt;version>* and */opt/&lt;lang>/current*.

Thus, if you put directory */opt/&lt;lang>/current/bin* in your *PATH*, you would run selected version.

This system is straightforward and works fine.

Installation
============

To install Babel:

- Drop scripts somewhere in your *PATH*.
- Create directories */opt/go*, i*/opt/lua*, */opt/python*, */opt/ruby* and/or */opt/java* depending on which language you want to manage.

Build your VMs with scripts *&lt;lang>-build version* (except for Java that you
install already built in appropriate directory */opt/java/&lt:version>*).

Languages
=========

GO
--

GO has no VM, thus:

- *go-build* script will install a given compiler and GO tools.
- *version go* script will switch between these versions.

You must set following environment variables:

- *PATH*: must include */opt/go/current/bin*.
- *GOROOT*: must be */opt/go/current*.
- *GOPATH*: must be set as you wish (*~/go* for instance).

**Note**:

Even if tests fail (which is the case for release *1.1* for instance), the compiler is installed. Nevertheless, tools are not.

Python
------

- *python-build* script will build the VM for given version.
- *version python* script will switch between these versions.

To build Python VM, you must install ifollowing development libraries:

- *tetex-nox* and *latex2html* to generate documentation for 2.6 and earlier versions.
- *libreadline-dev* to enable completion and line edition in interpreter.
- *libssl-dev* to enable HTTPS.
- *libzip-dev*, *libtar-dev*, *libbz2-dev*, *zlib1g-dev* to enable ZIP and TAR support.
- *libmysqld-dev*, *libmysqlclient-dev* and *python-dev* to install MySQL driver.
- *libsqlite3-dev* to enable sqlite3 support.

Ruby
----

- *ruby-build* script will build the VM for the given version.
- *version ruby* script will switch between these versions.

Java
----

- There is no build script: drop Java tarball content in */opt/java/&lt;version>* directory.
- *version java* script will switch between these versions.

You must set following environment variables:

- *PATH*: must include */opt/go/current/bin*.
- *JAVA_HOME*: must be */opt/java/current*.

Lua
---

- *lua-build* script will build the VM for the given version.
- *version lua* script will switch between these versions.

Rust
----

- *rust-build* script will build Rust from sources (which is *very* long).
- *version rust* script will switch between installed versions.

Download
========

You can download Babel here: <https://github.com/c4s4/babel/releases>.
