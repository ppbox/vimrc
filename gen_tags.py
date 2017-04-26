# -*- coding: utf-8 -*-

import os
import sys
import codecs
from encodings import utf_8

codecs.register(lambda encoding: utf_8.getregentry())


ANY = 'any'

HINT_MESSAGE = '''
Descriptions:
    Use ctags/cscope to generate tags for any languages

Usage: GenTags [options] [language] [directory]

options:
    -h/--hidden     include hiddenfiles like .svn .git
    -c/--clean      clean tags cscope.*

language:
    -cpp/-cxx/-c/-c++/-h/-hh/-hpp/-C/-H
    -java
    -php/-php5/-php6/-php7
    -py/-py2/-py3
    -perl
    -js/-javascript/-html/-htm
    -any                        generate anything

directory:
    directory name, such as /usr/bin ./ ../

Please try again'''

HIDDEN = False
CLEAN = False

def GenerateCtags(language, path):
    os.chdir(path)
    cppTypes = ['-cpp', '-c', '-cxx', '-cc', '-h', '-hpp', '-hh', '-c++', '-C', '-H']
    pyTypes = ['-py', '-py2', '-py3', '-PY', '-PY2', '-PY3']
    phpTypes = ['-php', '-PHP', '-php5', '-php6', '-php7']
    javaTypes = ['-java', '-JAVA']
    perlTypes = ['-perl', '-PERL']
    jsTypes = ['-js', '-javascript', '-html', '-htm']

    if language in cppTypes:
        os.system('ctags --languages=c++ --langmap=c++:+.in.x.inl.c.h --c++-kinds=+px --fields=+iaKSz --extra=+qf -R')
    elif language in pyTypes:
        os.system('ctags --languages=python --langmap=python:+.py3.python.python3 --fields=+iaS --extra=+q -R')
    elif language in phpTypes:
        os.system('ctags --languages=php --langmap=php:+.php3.php4.php5.php6.php7 --fields=+iaS --extra=+q -R')
    elif language in javaTypes:
        os.system('ctags --languages=java --langmap=java:+.j --java-kinds=+p --fields=+iaS --extra=+q -R')
    elif language in perlTypes:
        os.system('ctags --languages=perl --perl-kinds=+px --fields=+iaS --extra=+q -R')
    elif language in jsTypes:
        os.system('ctags --languages=javascript --langmap=javascript:+.javascript.html.htm --javascript-kinds=+px --fields=+iaS --extra=+q -R')
    else:
        os.system("ctags -R ")

def generateFile(targetFile, cscopeFiles):
    if (HIDDEN and targetFile == '.') or targetFile == 'tags':
        return
    if sys.platform == 'win32':
        separator = '\\'
        endLine = '\r\n'
    else:
        separator = '/'
        endLine = '\n'
    absPath = '"' + os.getcwd() + separator + targetFile + '"' + endLine
    cscopeFiles.write(absPath)

def GenerateByDirectories(path, cscopeFiles):
    if HIDDEN and path[0:1] == '.':
        return
    os.chdir(path)
    for eachFile in os.listdir('.'):
        if os.path.isfile(eachFile):
            generateFile(eachFile, cscopeFiles)
        elif os.path.isdir(eachFile):
            GenerateByDirectories(eachFile, cscopeFiles)
    os.chdir('..')

def GenerateCscopeFiles(path):
    os.chdir(path)
    cscopeFiles = open('cscope.files', 'w')
    GenerateByDirectories(path, cscopeFiles)
    cscopeFiles.close()

def GenerateCscope(path):
    GenerateCscopeFiles(path)
    os.chdir(path)
    os.system("cscope -Rbq -i cscope.files")


# --------------------------------------------------------------------------
#
# Main function
#
# --------------------------------------------------------------------------
if __name__ == '__main__':
    #import pdb
    #pdb.set_trace()
    try:
        for eachParam in sys.argv:
            if eachParam == '-h' or eachParam == '--hidden':
                HIDDEN = True
            if eachParam == '-c' or eachParam == '--clean':
                CLEAN = True
        # argv[1]: current file name
        # print(sys.argv[1])
        path = sys.argv[len(sys.argv)-1]
        path = os.path.abspath(path)
        if CLEAN:
            tagsFile = path + '/tags'
            cscopeFiles = path + '/cscope.files'
            cscopeInOut = path + '/cscope.in.out'
            cscopeOut = path + '/cscope.out'
            cscopePoOut = path + '/cscope.po.out'
            if os.path.isfile(tagsFile):
                os.remove(tagsFile)
            if os.path.isfile(cscopeFiles):
                os.remove(cscopeFiles)
            if os.path.isfile(cscopeInOut):
                os.remove(cscopeInOut)
            if os.path.isfile(cscopeOut):
                os.remove(cscopeOut)
            if os.path.isfile(cscopePoOut):
                os.remove(cscopePoOut)
            exit(0)
        language = sys.argv[len(sys.argv)-2]
        GenerateCtags(language, path)
        GenerateCscope(path)
    except Exception, e:
        print e
        print HINT_MESSAGE
