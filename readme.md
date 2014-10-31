Babel
=====

Babel is a set of tools to manage versions of VMs and compilers for your favorite programming languages. With these tools, you can:

- Build a given version of a VM or compiler.
- Switch between installed versions.

For instance, to install Python *2.7.8*:

```
python-build 2.7.8
```

To use Python *2.7.8*, type:

```
$ version python
Please choose a version:
0: Default
1: 2.5.2
2: 2.5.5
3: 2.6.6 *
4: 2.7.8
4
Selecting python version '2.7.8'
```

*version* script list all installed VMs or compilers so that you can choose one typing its indice in the list.

Index *0* is for the one of the system one. The star after a VM name indicates current version.

This tool is able to build and manage following programming languages:

- Go
- Python
- Ruby
- Java

How it works
------------

Build scripts builds and install VMs or compiler in directory */opt/&lt;lang>/&lt;version>*. Thus Python *2.7.8* would be installed in directory */opt/python/2.7.8*.

Script *version* selects a given version by making a symbolic link between */opt/&lt;lang>/&lt;version>* and */opt/&lt;lang>/current*.

Thus, if you put directory */opt/&lt;lang>/current/bin* in your *PATH*, you
would run selected version.

This system is straightforward and works fine for any language.

Installation
------------

To install Babel:

- Drop scripts somewhere in your *PATH*.
- Create directories */opt/go*, */opt/python*, */opt/ruby* and/or */opt/java* depending on which language you want to manage.

Build your VMs with scripts *&lt;lang>-build version* (except for Java that you
install already built in appropriate directory */opt/java/&lt:version>*).

Languages
---------

### GO

GO has no VM, thus:

- *go-build* script will install a given  compiler and GO tools.
-  *version* script will switch between these versions.
