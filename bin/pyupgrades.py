#!/usr/bin/env python

import xmlrpclib
import pip
import argparse
from pkg_resources import parse_version

def version_number_compare(version1, version2):
    return cmp(parse_version(version1), parse_version(version2))

def print_status(package, message):
    package_str = '{package.project_name} {package.version}'.format(package=package)
    print '{package:40} {message}'.format(package=package_str, message=message)


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description='Process some integers.')
    parser.add_argument('-a', '--all', dest='all', action='store_true', default=False)
    parser.add_argument('-m', '--mirror', dest='mirror', default='http://pypi.python.org/pypi')

    args = parser.parse_args()

    if not args:
        exit(-1)

    pypi = xmlrpclib.ServerProxy(args.mirror)
    for dist in pip.get_installed_distributions():

        available = pypi.package_releases(dist.project_name)
        if not available:
            # Try the capitalized package name
            available = pypi.package_releases(dist.project_name.capitalize())

        upgrade_available = True
        if not available:
            print_status(dist, 'no releases at pypi')
            continue

        try:
            comparison = version_number_compare(available[0], dist.version)
        except ValueError:
            continue
        if comparison == 0:
            if not args.all:
                continue
            print_status(dist, 'up to date')
        elif comparison < 0:
            print_status(dist, 'older version on pypi')
        else:
            print_status(dist, '%s available' % available[0])
