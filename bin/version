#!/usr/bin/env python
# encoding: UTF-8

'''
Script to select current version for a given soft (python, ruby or java).
'''

import os
import re
import sys
import glob
import getopt


# fix input in Python 2 and 3
try:
    input = raw_input # pylint: disable=redefined-builtin,invalid-name
except NameError:
    pass


class Version(object): # pylint: disable=useless-object-inheritance
    '''
    Software management class
    '''

    HELP = '''version [-h] software
Select software version in a menu:
-h        To print this help screen.
software  Software version to choose.'''
    SELECTED = ' *'

    def __init__(self, soft):
        '''
        Constructor that takes software name
        '''
        self.soft = soft
        self.app_dir = os.environ.get('APP_DIR')
        if self.app_dir is None:
            self.app_dir = '/opt'
        self.sudo = True
        if os.access(self.app_dir, os.W_OK):
            self.sudo = False
        self.soft_root = os.path.join(self.app_dir, self.soft)
        self.soft_paths = sorted(glob.glob(self.soft_root+'/[0-9]*'))
        self.versions = [v[len(self.soft_root)+1:] for v in self.soft_paths]
        path = os.path.realpath("%s/current" % self.soft_root)
        self.current_version = path[path.rindex(os.path.sep)+1:]

    def set_version(self, index):
        '''
        Set software version by index
        '''
        sudo = 'sudo ' if self.sudo else ''
        old_dir = "current"
        if index == -1:
            print("Selecting system version")
            if os.path.exists(os.path.join(self.soft_root, old_dir)):
                os.system("cd %s && %srm %s" % (self.soft_root, sudo, old_dir))
        else:
            print("Selecting %s version '%s'" %
                  (self.soft, self.versions[index]))
            directory = self.versions[index]
            if os.path.exists(os.path.join(self.soft_root, old_dir)):
                os.system("cd %s && %srm %s" % (self.soft_root, sudo, old_dir))
            os.system("cd %s && %sln -s %s %s" % (self.soft_root, sudo, directory, old_dir))

    def ask_version(self):
        '''
        Prompt user for software version in the list of installed versions
        '''
        # print version list
        print('Please choose a version:')
        index = 1
        if self.current_version == 'current':
            selected = self.SELECTED
        else:
            selected = ''
        print("0: System"+selected)
        for version in self.soft_paths:
            number = version[len(self.soft_root)+1:]
            if number == self.current_version:
                selected = self.SELECTED
            else:
                selected = ''
            print(str(index)+': '+str(number)+selected)
            index += 1
        # ask for the version
        chosen = None
        maximum = len(self.soft_paths)
        while not chosen:
            try:
                choice = input()
            except KeyboardInterrupt:
                print("\nUser abort!")
                sys.exit(0)
            if re.match('\\d+', choice) and int(choice) <= maximum and \
                    int(choice) >= 0:
                index = int(choice) - 1
                chosen = True
            elif choice == '':
                print("Keeping current")
                sys.exit(0)
            else:
                print("Bad version, please choose a number between 0 and %s" %
                      str(maximum))
        # return index in version table
        return index

    @staticmethod
    def run():
        '''
        Read software name on command line and run version selection
        '''
        try:
            opts, args = getopt.getopt(sys.argv[1:], 'h', ['help'])
        except getopt.GetoptError as exception:
            print('Error parsing command line: %s' % exception)
            print(Version.HELP)
            sys.exit(1)
        for option, _ in opts:
            if option in ('-h', '--help'):
                print(Version.HELP)
                sys.exit(0)
            else:
                print("Error parsing command line: Unhandled option '%s'" % option)
                print(Version.HELP)
                sys.exit(2)
        if len(args) != 1:
            print("Error parsing command line: You must pass software")
            print(Version.HELP)
            sys.exit(1)
        soft = args[0]
        version = Version(soft)
        version.set_version(version.ask_version())


if __name__ == '__main__':
    Version.run()
