VM Tools
========

VM Tools are a set of scripts to manage VMs. With these tools, you can:

- Build a given version of a VM.
- Switch between installed version of a VM.

For instance, to install Python *2.7.8* and *3.4.2* type following commands:

```
python-build 2.7.8
python-build 3.4.2
```

To enable Python *2.7.8*, type:

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

*version* script list all installed VMs and you choose one typing its indice in
the list. *0* is for system one, so that when you type *python* it will call
the version installed with your system. The star after a VM name indicates 
currently selected version.

This tool is able to build and manage following programming languages:

- Go
- Python
- Ruby
- Java

How it works
------------

Build scripts build and install VMs in directory */opt/&lt;lang>/&lt;version>*.
Thus Python *2.7.8* would be installed in directory */opt/python/2.7.8*.

Script to enable versions just create a symbolic link between directory
*/opt/&lt;lang>/&lt;version>* and */opt/&lt;lang>/current*. It lists all
installed 

Thus, if you put directory */opt/&lt;lang>/current/bin* in your *PATH*, you
would run selected Python version.

This system is quite straightforward and works fine for all VMs.

Installation
------------

To install these tools:

- Drop scripts somewhere in your *PATH* or add the tools directory in your
  *PATH*.
- Create directories */opt/go*, */opt/python*, */opt/ruby* and/or */opt/java*
  depending on which VMs you want to install.

Build your VMs with scripts *&lt;lang>-build version* (except for Java that you
install already built in appropriate directory */opt/java/&lt:version>*).

Languages
---------

### GO

GO has no VM, thus build script will install the compiler and *version* script
will switch between these versions.

When you build GO, it will also install GO tools (such as ).


